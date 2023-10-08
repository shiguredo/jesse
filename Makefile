# See LICENSE for licensing information.
.PHONY: all
all: ebin/jesse.app bin/jesse

.PHONY: ci
ci: test

.PHONY: clean
clean:
	@./rebar3 clean

# Compile

bin/jesse: escript
	mkdir -p bin
	cp -a _build/default/bin/jesse bin/jesse

ebin/jesse.app: compile

.PHONY: escript
escript: ebin/jesse.app
	@./rebar3 escriptize
	./_build/default/bin/jesse --help

.PHONY: compile
compile:
	@./rebar3 compile

# Tests

test/JSON-Schema-Test-Suite/tests:
	git submodule sync --recursive
	git submodule update --init --recursive

.PHONY: test
test: xref eunit ct dialyzer proper cover

.PHONY: elvis
elvis:
	@./rebar3 lint

.PHONY: check
check: elvis

.PHONY: eunit
eunit:
	@./rebar3 as test eunit

.PHONY: ct
ct:
	@./rebar3 as test ct

.PHONY: xref
xref:
	@./rebar3 xref

.PHONY: dialyzer
dialyzer:
	@./rebar3 dialyzer

.PHONY: cover
cover:
	@./rebar3 as test cover -v

.PHONY: proper
proper:
	@./rebar3 as test proper
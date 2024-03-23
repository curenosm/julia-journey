    # [**10.** REPL Mode Reference](@id REPL-Mode-Reference)

    This section describes available commands in the Pkg REPL.
    The Pkg REPL mode is mostly meant for interactive use,
    and for non-interactive use it is recommended to use the
    functional API, see [API Reference](@ref API-Reference).

## `package` commands
```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-add" href="#repl-add">
            <code>add</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["add"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-build" href="#repl-build">
            <code>build</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["build"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-compat" href="#repl-compat">
            <code>compat</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["compat"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-develop" href="#repl-develop">
            <code>develop</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["develop"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-free" href="#repl-free">
            <code>free</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["free"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-generate" href="#repl-generate">
            <code>generate</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["generate"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-pin" href="#repl-pin">
            <code>pin</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["pin"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-remove" href="#repl-remove">
            <code>remove</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["remove"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-test" href="#repl-test">
            <code>test</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["test"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-update" href="#repl-update">
            <code>update</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["update"].help
```
```@raw html
    </section>
</article>
```

## `registry` commands
```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-registry-add" href="#repl-registry-add">
            <code>registry add</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["registry add"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-registry-remove" href="#repl-registry-remove">
            <code>registry remove</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["registry remove"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-registry-status" href="#repl-registry-status">
            <code>registry status</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["registry status"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-registry-update" href="#repl-registry-update">
            <code>registry update</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["registry update"].help
```
```@raw html
    </section>
</article>
```

## Other commands
```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-activate" href="#repl-activate">
            <code>activate</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["activate"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-gc" href="#repl-gc">
            <code>gc</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["gc"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-help" href="#repl-help">
            <code>help</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["help"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-instantiate" href="#repl-instantiate">
            <code>instantiate</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["instantiate"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-precompile" href="#repl-precompile">
            <code>precompile</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["precompile"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-resolve" href="#repl-resolve">
            <code>resolve</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["resolve"].help
```
```@raw html
    </section>
</article>
```

```@raw html
<article class="docstring">
    <header>
        <a class="docstring-binding" id="repl-status" href="#repl-status">
            <code>status</code>
        </a>
        -
        <span class="docstring-category">REPL command</span>
    </header>
    <section>
```
```@eval
using Pkg
Dict(Pkg.REPLMode.canonical_names())["status"].help
```
```@raw html
    </section>
</article>
```


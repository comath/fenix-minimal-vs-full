# Minimal example of linker problem with fenix

Run `nix-build -A packages.goodbye_world` to reproduce the error. It seems to be in the full toolchain as the minimal toolchain `nix-build -A packages.hello_world` will work.

```bash
➜  test git:(main) ✗ nix-build -A packages.goodbye_world
warning: unknown setting 'nixpkgs.config.allowUnfree'
this derivation will be built:
  /nix/store/2rvir31zj79a4sxh7i29rkj0jnsvnlw3-example-0.1.0.drv
warning: unknown setting 'nixpkgs.config.allowUnfree'
building '/nix/store/2rvir31zj79a4sxh7i29rkj0jnsvnlw3-example-0.1.0.drv'...
Running phase: unpackPhase
unpacking source archive /nix/store/vbvc0akgjh4mrd34w1gkn12026jkgbhh-test
source root is test
Executing cargoSetupPostUnpackHook
Finished cargoSetupPostUnpackHook
Running phase: patchPhase
Executing cargoSetupPostPatchHook
Validating consistency between /build/test/Cargo.lock and /build/cargo-vendor-dir/Cargo.lock
Finished cargoSetupPostPatchHook
Running phase: updateAutotoolsGnuConfigScriptsPhase
Running phase: configurePhase
Running phase: buildPhase
Executing cargoBuildHook
cargoBuildHook flags: -j 48 --target x86_64-unknown-linux-gnu --offline --profile release
   Compiling foo v0.1.0 (/build/test)
error: linking with `/nix/store/dmypp1h4ldn0vfk3fi6yfyf5yxp9yz0k-gcc-wrapper-14.3.0/bin/cc` failed: exit status: 1
  |
  = note:  "/nix/store/dmypp1h4ldn0vfk3fi6yfyf5yxp9yz0k-gcc-wrapper-14.3.0/bin/cc" "-m64" "/build/rustc2b6LQq/symbols.o" "<2 object files omitted>" "-Wl,--as-needed" "-Wl,-Bstatic" "<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/lib/{libstd-*,libpanic_unwind-*,libobject-*,libmemchr-*,libaddr2line-*,libgimli-*,librustc_demangle-*,libstd_detect-*,libhashbrown-*,librustc_std_workspace_alloc-*,libminiz_oxide-*,libadler2-*,libunwind-*,libcfg_if-*,liblibc-*,librustc_std_workspace_core-*,liballoc-*,libcore-*,libcompiler_builtins-*}.rlib" "-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-L" "/build/rustc2b6LQq/raw-dylibs" "-B<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/bin/gcc-ld" "-fuse-ld=lld" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L" "<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "/build/test/target/x86_64-unknown-linux-gnu/release/deps/foo-c2daa5e4e2020185" "-Wl,--gc-sections" "-pie" "-Wl,-z,relro,-z,now" "-Wl,-O1" "-nodefaultlibs" "/build/test/target/x86_64-unknown-linux-gnu/release/deps/foo_audit_data.o" "-Wl,--undefined=AUDITABLE_VERSION_INFO"
  = note: some arguments are omitted. use `--verbose` to show all linker arguments
  = note: collect2: fatal error: posix_spawnp: No such file or directory
          compilation terminated.
          

error: could not compile `foo` (bin "foo") due to 1 previous error
error: Cannot build '/nix/store/2rvir31zj79a4sxh7i29rkj0jnsvnlw3-example-0.1.0.drv'.
       Reason: builder failed with exit code 101.
       Output paths:
         /nix/store/m4rmng9vh31rv3daw7hg1wkxzfvr93jr-example-0.1.0
       Last 24 log lines:
       > Running phase: unpackPhase
       > unpacking source archive /nix/store/vbvc0akgjh4mrd34w1gkn12026jkgbhh-test
       > source root is test
       > Executing cargoSetupPostUnpackHook
       > Finished cargoSetupPostUnpackHook
       > Running phase: patchPhase
       > Executing cargoSetupPostPatchHook
       > Validating consistency between /build/test/Cargo.lock and /build/cargo-vendor-dir/Cargo.lock
       > Finished cargoSetupPostPatchHook
       > Running phase: updateAutotoolsGnuConfigScriptsPhase
       > Running phase: configurePhase
       > Running phase: buildPhase
       > Executing cargoBuildHook
       > cargoBuildHook flags: -j 48 --target x86_64-unknown-linux-gnu --offline --profile release
       >    Compiling foo v0.1.0 (/build/test)
       > error: linking with `/nix/store/dmypp1h4ldn0vfk3fi6yfyf5yxp9yz0k-gcc-wrapper-14.3.0/bin/cc` failed: exit status: 1
       >   |
       >   = note:  "/nix/store/dmypp1h4ldn0vfk3fi6yfyf5yxp9yz0k-gcc-wrapper-14.3.0/bin/cc" "-m64" "/build/rustc2b6LQq/symbols.o" "<2 object files omitted>" "-Wl,--as-needed" "-Wl,-Bstatic" "<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/lib/{libstd-*,libpanic_unwind-*,libobject-*,libmemchr-*,libaddr2line-*,libgimli-*,librustc_demangle-*,libstd_detect-*,libhashbrown-*,librustc_std_workspace_alloc-*,libminiz_oxide-*,libadler2-*,libunwind-*,libcfg_if-*,liblibc-*,librustc_std_workspace_core-*,liballoc-*,libcore-*,libcompiler_builtins-*}.rlib" "-Wl,-Bdynamic" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-L" "/build/rustc2b6LQq/raw-dylibs" "-B<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/bin/gcc-ld" "-fuse-ld=lld" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L" "<sysroot>/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "/build/test/target/x86_64-unknown-linux-gnu/release/deps/foo-c2daa5e4e2020185" "-Wl,--gc-sections" "-pie" "-Wl,-z,relro,-z,now" "-Wl,-O1" "-nodefaultlibs" "/build/test/target/x86_64-unknown-linux-gnu/release/deps/foo_audit_data.o" "-Wl,--undefined=AUDITABLE_VERSION_INFO"
       >   = note: some arguments are omitted. use `--verbose` to show all linker arguments
       >   = note: collect2: fatal error: posix_spawnp: No such file or directory
       >           compilation terminated.
       >           
       >
       > error: could not compile `foo` (bin "foo") due to 1 previous error
       For full logs, run:
         nix-store -l /nix/store/2rvir31zj79a4sxh7i29rkj0jnsvnlw3-example-0.1.0.drv
```

```bash
➜  test git:(main) ✗ nix-build -A packages.hello_world   
warning: unknown setting 'nixpkgs.config.allowUnfree'
this derivation will be built:
  /nix/store/as8a62zjb696y1nwfnzdnakqbxglaj3z-example-0.1.0.drv
warning: unknown setting 'nixpkgs.config.allowUnfree'
building '/nix/store/as8a62zjb696y1nwfnzdnakqbxglaj3z-example-0.1.0.drv'...
Running phase: unpackPhase
unpacking source archive /nix/store/r6hzig2xs0mwwckcchwn4ka85k025bw0-test
source root is test
Executing cargoSetupPostUnpackHook
Finished cargoSetupPostUnpackHook
Running phase: patchPhase
Executing cargoSetupPostPatchHook
Validating consistency between /build/test/Cargo.lock and /build/cargo-vendor-dir/Cargo.lock
Finished cargoSetupPostPatchHook
Running phase: updateAutotoolsGnuConfigScriptsPhase
Running phase: configurePhase
Running phase: buildPhase
Executing cargoBuildHook
cargoBuildHook flags: -j 48 --target x86_64-unknown-linux-gnu --offline --profile release
   Compiling foo v0.1.0 (/build/test)
    Finished `release` profile [optimized] target(s) in 0.25s
Executing cargoInstallPostBuildHook
Finished cargoInstallPostBuildHook
Finished cargoBuildHook
Running phase: checkPhase
Executing cargoCheckHook
cargoCheckHook flags: -j 48 --profile release --target x86_64-unknown-linux-gnu --offline --
   Compiling foo v0.1.0 (/build/test)
    Finished `release` profile [optimized] target(s) in 0.09s
     Running unittests src/main.rs (target/x86_64-unknown-linux-gnu/release/deps/foo-648b95e19692d9c8)

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

Finished cargoCheckHook
Running phase: installPhase
Executing cargoInstallHook
Finished cargoInstallHook
Running phase: fixupPhase
shrinking RPATHs of ELF executables and libraries in /nix/store/73dlas5c937d9ggmj1vgh1nbw5vbnncf-example-0.1.0
shrinking /nix/store/73dlas5c937d9ggmj1vgh1nbw5vbnncf-example-0.1.0/bin/foo
checking for references to /build/ in /nix/store/73dlas5c937d9ggmj1vgh1nbw5vbnncf-example-0.1.0...
patching script interpreter paths in /nix/store/73dlas5c937d9ggmj1vgh1nbw5vbnncf-example-0.1.0
stripping (with command strip and flags -S -p) in  /nix/store/73dlas5c937d9ggmj1vgh1nbw5vbnncf-example-0.1.0/bin
/nix/store/73dlas5c937d9ggmj1vgh1nbw5vbnncf-example-0.1.0
```
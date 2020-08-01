# macosx-avalonia-net48-skia-crash

This repo illustrates the native crash posted below. It is created via the
`avalonia.mvvm` template with some minor modifications for version updates.

## Build and run

`./create-build-run.sh` will create, build, and attempt to run the project in
the `MyApp` directory.

Once the application loads, close the window and you will get the following
native crash:

```
=================================================================
    Native Crash Reporting
=================================================================
Got a segv while executing native code. This usually indicates
a fatal error in the mono runtime or one of the native libraries
used by your application.
=================================================================

=================================================================
    Native stacktrace:
=================================================================
    0x108272ad9 - /Library/Frameworks/Mono.framework/Versions/Current/Commands/mono : mono_dump_native_crash_info
    0x10820afb5 - /Library/Frameworks/Mono.framework/Versions/Current/Commands/mono : mono_handle_native_crash
    0x10826cc56 - /Library/Frameworks/Mono.framework/Versions/Current/Commands/mono : altstack_handle_and_restore
    0x7fff3fc708ac - /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib : glDeleteBuffers
    0x10fc5f36c - /private/tmp/macosx-avalonia-crash/MyApp/bin/Debug/net48/libSkiaSharp.dylib : gr_backendrendertarget_get_gl_framebufferinfo
    0x10fb03e9f - /private/tmp/macosx-avalonia-crash/MyApp/bin/Debug/net48/libSkiaSharp.dylib : gr_backendrendertarget_get_gl_framebufferinfo
    0x10fb2a9cd - /private/tmp/macosx-avalonia-crash/MyApp/bin/Debug/net48/libSkiaSharp.dylib : gr_backendrendertarget_get_gl_framebufferinfo
    0x10faf104c - /private/tmp/macosx-avalonia-crash/MyApp/bin/Debug/net48/libSkiaSharp.dylib : gr_backendrendertarget_get_gl_framebufferinfo
    0x10fb05615 - /private/tmp/macosx-avalonia-crash/MyApp/bin/Debug/net48/libSkiaSharp.dylib : gr_backendrendertarget_get_gl_framebufferinfo
    0x1102fa5b4 - Unknown
    0x11430d95c - Unknown
    0x1083f3119 - /Library/Frameworks/Mono.framework/Versions/Current/Commands/mono : mono_gc_run_finalize
    0x10841201c - /Library/Frameworks/Mono.framework/Versions/Current/Commands/mono : sgen_gc_invoke_finalizers
    0x1083f5009 - /Library/Frameworks/Mono.framework/Versions/Current/Commands/mono : finalizer_thread
    0x1083a16ed - /Library/Frameworks/Mono.framework/Versions/Current/Commands/mono : start_wrapper
    0x7fff6ffc4109 - /usr/lib/system/libsystem_pthread.dylib : _pthread_start
    0x7fff6ffbfb8b - /usr/lib/system/libsystem_pthread.dylib : thread_start

=================================================================
    Telemetry Dumper:
=================================================================
Pkilling 0x11697cdc0 from 0x70000865e000
Entering thread summarizer pause from 0x70000865e000
Finished thread summarizer pause from 0x70000865e000.
Failed to create breadcrumb file (null)/crash_hash_0x8d658a08a

Waiting for dumping threads to resume

=================================================================
    External Debugger Dump:
=================================================================

=================================================================
    Basic Fault Address Reporting
=================================================================
Memory around native instruction pointer (0x7fff3fc708ac):
0x7fff3fc7089c  89 e5 48 89 f2 89 fe 65 48 8b 04 25 f0 00 00 00  ..H....eH..%....
0x7fff3fc708ac  48 8b 88 20 14 00 00 48 8b 38 5d ff e1 55 48 89  H.. ...H.8]..UH.
0x7fff3fc708bc  e5 48 89 f2 89 fe 65 48 8b 04 25 f0 00 00 00 48  .H....eH..%....H
0x7fff3fc708cc  8b 88 28 14 00 00 48 8b 38 5d ff e1 55 48 89 e5  ..(...H.8]..UH..

=================================================================
    Managed Stacktrace:
=================================================================
      at <unknown> <0xffffffff>
      at System.Object:wrapper_native_0x10f8b4820 <0x00093>
      at SkiaSharp.SkiaApi:sk_refcnt_safe_unref <0x00091>
      at SkiaSharp.SKObjectExtensions:SafeUnRef <0x000ea>
      at SkiaSharp.SKObject:DisposeNative <0x000c2>
      at SkiaSharp.SKNativeObject:Dispose <0x000ab>
      at SkiaSharp.SKObject:Dispose <0x0004a>
      at SkiaSharp.GRContext:Dispose <0x0004a>
      at SkiaSharp.SKNativeObject:Finalize <0x00041>
      at System.Object:runtime_invoke_virtual_void__this__ <0x000ab>
=================================================================
[1]    39765 abort      mono MyApp.exe
```

### Version Information

```
$ mono --version
Mono JIT compiler version 6.10.0.106 (2019-12/77769615db1 Fri Jul 24 10:38:55 EDT 2020)
Copyright (C) 2002-2014 Novell, Inc, Xamarin Inc and Contributors. www.mono-project.com
    TLS:
    SIGSEGV:       altstack
    Notification:  kqueue
    Architecture:  amd64
    Disabled:      none
    Misc:          softdebug
    Interpreter:   yes
    LLVM:          yes(610)
    Suspend:       hybrid
    GC:            sgen (concurrent by default)

$ dotnet --version
3.1.302

$ dotnet --list-sdks
3.1.301 [/usr/local/share/dotnet/sdk]
3.1.302 [/usr/local/share/dotnet/sdk]

$ dotnet --list-runtimes
Microsoft.AspNetCore.App 3.1.5 [/usr/local/share/dotnet/shared/Microsoft.AspNetCore.App]
Microsoft.AspNetCore.App 3.1.6 [/usr/local/share/dotnet/shared/Microsoft.AspNetCore.App]
Microsoft.NETCore.App 2.1.19 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
Microsoft.NETCore.App 2.1.20 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
Microsoft.NETCore.App 3.1.5 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
Microsoft.NETCore.App 3.1.6 [/usr/local/share/dotnet/shared/Microsoft.NETCore.App]
```

# Starfire

Starfire is a teen titan's operating system. Built using [Limine](https://github.com/limine-bootloader/limine) and [Zig](https://ziglang.org), it sports an **x86_64 kernel** capable of doing... things. Starfire is still in development, so it isn't capable of doing much.

## Building

Building Starfire requires **Zig 0.13.0**. You can build and run it like this:

```bash
$ zig build run-qemu
```

This will create a debug build of Starfire and run it inside QEMU. You can then connect to the serial I/O using something like `netcat`:

```bash
$ nc 127.0.0.1 4444
```

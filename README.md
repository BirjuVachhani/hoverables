# Hover Builder

Easiest and cleanest way to build hover effects in Flutter. This package provides a simple way to build hover effects
in Flutter without dealing with managing hover state explicitly.

[![Pub Package](https://img.shields.io/pub/v/hoverables.svg)](https://pub.dev/packages/hoverables) [![Code Quality](https://github.com/BirjuVachhani/hoverables/workflows/Code%20Quality/badge.svg?branch=main)](https://github.com/BirjuVachhani/hoverables/actions)

Demo: [Playground](https://hoverables.codemagic.app/)

## Features

- `HoverBuilder`: A simple yet powerful builder to build hover effects.
- [Coming Soon] `AnimatedHoverBuilder`: A builder that provides hover state with animation.
- [Coming Soon] `GrabRegion`: A widget that changes the cursor to `grab` when hovered and `grabbing` when pressed.

## Getting Started

1. Add as a dependency in your project's `pub spec.yaml`

```dart
dependencies:
hoverables: <latest_version>
```
2. Import library into your code.

```dart
import 'package:hoverables/hoverables.dart';
```

## Usage

### Using `HoverBuilder`

`HoverBuilder` allows you to build hover effects easily. It provides a `builder` function that gives you the current
hover state of the widget.

```dart
HoverBuilder(
  builder: (context, hovering, child) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 200),
      scale: hovering ? 1.35 : 1,
      child: child,
    );
  },
  child: GestureDetector(
    onTap: onTap,
    child: Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text('Hover Scale'),
    ),
  ),
);
```

Checkout [example](https://github.com/BirjuVachhani/hoverables/blob/main/example/lib/main.dart) for more examples.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/BirjuVachhani/hoverables/issues
[docs]: https://pub.dev/documentation/hoverables/latest/

#### Liked this package?

Show some love and support by starring the [repository](https://github.com/birjuvachhani/hoverables).

Or You can

<a href="https://www.buymeacoffee.com/birjuvachhani" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>


## License

```
Copyright (c) 2024, Birju Vachhani
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

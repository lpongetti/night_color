# Night Color

[![pub package](https://img.shields.io/pub/v/night_color.svg)](https://pub.dartlang.org/packages/night_color) ![travis](https://api.travis-ci.com/lpongetti/night_color.svg?branch=master)

Night Color adjusts the color temperature of your screen according to your surroundings. This may help your eyes hurt less if you are working in front of the screen at night.

## Usage

Add night color to your pubspec:

```yaml
dependencies:
  night_color: any # or the latest version on Pub
```

Use it

```dart
@override
Widget build(BuildContext context) {
  return NightColor(
    enabled: enabled,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Night Color Demo Home Page'),
      ),
      body: Container(),
    ),
  );
}
```

### Run the example

See the `example/` folder for a working example app.

## Supporting Me

A donation through my Ko-Fi page would be infinitly appriciated:
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/lorenzopongetti)

but, if you can't or won't, a star on GitHub and a like on pub.dev would also go a long way!

Every donation gives me fuel to continue my open-source projects and lets me know that I'm doing a good job.

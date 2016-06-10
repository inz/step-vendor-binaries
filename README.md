# vendor binaries step

This step will download and extract everything listed in `.vendor_urls` in your project.

Mirrors the functionality of the [Vendor Binaries](https://github.com/peterkeen/heroku-buildpack-vendorbinaries) buildpack for Heroku.

## Example

```yaml
build:
    steps:
        - inz/vendor-binaries
```

# License

The MIT Licence (MIT)

# Changelog

## 1.0.1

- Initial release
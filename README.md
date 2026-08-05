# setup-swift-wasm-sdk

This action is intended to perform the necessary steps to prepare the Swift WebAssembly (WASM) SDK in order to build Swift packages in GitHub Actions.

## Motivation

GitHub runners do not come pre-installed with the Swift WASM SDK.

This action downloads the appropriate Swift WASM SDK for the version of Swift in use on the runner and configures it so it is ready to build Swift packages.

## Input Parameters

| Name            | Required | Description                                                  |
| --------------- | :------: | ------------------------------------------------------------ |
| `target-triple` |   Yes    | The target triple that will be used when building the Swift package. This is needed during the SDK setup process. |

## Output Parameters

The action outputs the following parameters:

| Name | Description | Example                    |
| ---- | ----------- | -------------------------- |
| `id` | SDK ID      | `swift-6.3.3-RELEASE_wasm` |

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    env:
      TARGET_TRIPLE: wasm32-unknown-wasip1
    steps:
    - uses: actions/checkout@main
    - uses: orchetect/setup-swift-wasm-sdk@v1
      with:
        target-triple: ${{ env.TARGET_TRIPLE }}
    - name: Build Package
    - run: swift build --swift-sdk "$SDK_ID" --triple "$TARGET_TRIPLE"
      env:
        SDK_ID: ${{ steps.sdk-setup.outputs.id }}
```

## Documentation

This README serves as basic documentation.

## Author

Coded by a bunch of 🐹 hamsters in a trenchcoat that calls itself [@orchetect](https://github.com/orchetect).

## License

Licensed under the MIT license. See [LICENSE](https://github.com/orchetect/setup-swift-wasm-sdk/blob/main/LICENSE) for details.

## Community & Support

Please do not email maintainers for technical support. Several options are available for issues and questions:

- Questions and feature ideas can be posted to [Discussions](https://github.com/orchetect/setup-swift-wasm-sdk/discussions).
- If an issue is a verifiable bug with reproducible steps it may be posted in [Issues](https://github.com/orchetect/setup-swift-wasm-sdk/issues).

## Contributions

Contributions are welcome. Posting in [Discussions](https://github.com/orchetect/setup-swift-wasm-sdk/discussions) first prior to new submitting PRs for features or modifications is encouraged.

## Code Quality & AI Contribution Policy

In an effort to maintain a consistent level of code quality and safety, this repository was built by hand and is maintained without the use of AI code generation.

AI-assisted contributions are welcome, but must remain modest in scope, maintain the same degree of quality and care, and be thoroughly vetted before acceptance.

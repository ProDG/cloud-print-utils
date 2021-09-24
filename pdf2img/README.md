# pdf2img AWS Lambda

Creates a Lamda Layer with dependencies for pdf2img library.

## Lambda Layer

Build layer:

    $ make build/pdf2img-layer-python3.8.zip

    # for future runtimes, eg: python3.9
    # RUNTIME=python3.9 make build/pdf2img-layer-python3.9.zip

Deploy layer:

    $ aws lambda publish-layer-version \
        --region <region> \
        --layer-name <name> \
        --zip-file fileb://build/pdf2img-layer-python3.8.zip

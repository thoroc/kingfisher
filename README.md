# Wing it Websales Gateway

* [Hello, Winglang Hexagon!](https://itnext.io/hello-winglang-hexagon-6f2bdb550f37)
* [Implementing Production-grade CRUD REST API in Winglang](https://itnext.io/implementing-production-grade-crud-rest-api-in-winglang-7b8f6917efc2)
* [Revolutionize Cloud Programming with Wing: A New Cloud-Oriented Language](https://artemsokhin.medium.com/cloud-oriented-language-or-deploy-your-infrastructure-anywhere-with-wing-34f1d32bf336)

## Deployment

Ensure that you have the following

`.env` file:

```sh
ORGANISATION_NAME=Acme
AWS_REGION=eu-west-1
AWS_ACCESS_KEY_ID=<YOUR_AWS_ACCESS_KEY_ID>
AWS_SECRET_ACCESS_KEY="<YOUR_AWS_SECRET_ACCESS_KEY>"
```

And then run the `just` target equivalent to `terraform plan`

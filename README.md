# Docker On Run / On Ready / On Start

Imagine: After the `mongodb` start, it will dump `db2dump` and restore it.

Then, how to implement an **"On Run"** / **"On Ready"** _event_ on _Docker_?

## How to

You can use the `HEALTHCHECK` to do something like these examples:

- [Docker Image](docker/README.md)
- [Docker Image with variables](docker-variables/README.md)
- [Docker Compose](docker-compose-only/README.md)

## Documentation

- [Docker Heath Check reference](https://docs.docker.com/engine/reference/builder/#healthcheck)
- [Docker-Compose Health Check reference](https://docs.docker.com/compose/compose-file/#healthcheck)

## Issues & References

- https://github.com/docker/compose/issues/1809
  - https://github.com/docker/compose/issues/1809#issuecomment-657815188
- https://github.com/compose-spec/compose-spec/issues/84
  - https://github.com/compose-spec/compose-spec/issues/84#issuecomment-654585350

## Example output

- You can see the error `cat: /test.txt: No such file or directory` until the **health check** is ready.
- You can see only one `x` inside `/test.txt` after run, because the `init` script was
  executed only once.

```text
Creating network "tmp_default" with the default driver
Creating tmp_test_1 ... done
Attaching to tmp_test_1
test_1  | + set +e
test_1  | + true
test_1  | + cat /test.txt
test_1  | cat: /test.txt: No such file or directory
test_1  | + sleep 3
test_1  | + true
test_1  | + cat /test.txt
test_1  | cat: /test.txt: No such file or directory
test_1  | + sleep 3
test_1  | + true
test_1  | + cat /test.txt
test_1  | x
test_1  | + sleep 3
test_1  | + true
test_1  | + cat /test.txt
test_1  | x
test_1  | + sleep 3
test_1  | + true
test_1  | + cat /test.txt
test_1  | x
test_1  | + sleep 3
```

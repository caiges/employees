> employeesdb is a toolchain for querying the employees database provided by https://github.com/datacharmer/test_db.

# Developing on the employeesdb app

To work on the exercise you can use docker-compose command:

```
docker-compose run app bash
```

Once in the shell, you can run:

```
bundle
...
edit some code
...
./exe/employeesdb salaries department 1999
```

## Running tests

While in the shell run:

```
rake spec
```

# Running a production-like build of employeesdb

This uses a multi-stage Docker build to demonstrate how you might run this toolchain in as a typical user would.

```
docker-compose run employeesdb salaries department 1999
```

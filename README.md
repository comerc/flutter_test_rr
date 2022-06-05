# flutter_test_rr

[Почитал про Dataverse](https://youtu.be/L7NM_cB0xjU)
[Выполнил тестовое задание - 1 серия](https://youtu.be/Izc_VSb9ofw)
[Выполнил тестовое задание - 2 серия](https://youtu.be/6ShCgnQptFQ)
[Выполнил тестовое задание - 3 серия](https://youtu.be/I8IzOv1v-Vw)

## Getting Started

### Build the docker image

Use docker build the container image

```
docker build -t flutter_test_rr .
```

If you have some problem during cache, you can clean cache by this

```
docker build --no-cache -t flutter_test_rr .
```

### After Success building image

Run the docker image with localhost 1200 port. You can change to any other port just replace it.

```
docker run -i -p 1200:5000 -td flutter_test_rr
```

Here we go, open browser and go to http://localhost:1200/

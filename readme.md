# Clone the repository

```bash
git clone https://github.com/omkar342/docker-practice
```

# Turn on docker by opening the docker desktop


# Docker Commands for docker-practice

- **Docker Build**: Builds an image from a Dockerfile

  ```
  docker build -t docker-practice .
  ```

- **Docker Run**: To run docker file

  ```
  docker run -d -p 3002:3000 -e PORT=3000 docker-practice
  ```

**Description**: Above Command runs a Docker container in detached mode (-d) with port mapping, mapping port 4000 on the host to port 3001 in the container. The container is named docker-practice.

- **Docker Execution**: To execute a command in a running Docker container, use the `docker exec` command. For example, to list the files in the root directory of a running container, you can run:

  ```
  docker exec -it <container_name_or_id> ls

  ```

**Docker Exec**: Executes a co mmand in a running Docker container. Replace <container_name_or_id> with the actual ID of the running Docker container where you want to execute the command.

# Dockerfile Explanation

## 1. `FROM node:20`

This instruction specifies the base image to use for building this Docker image. It instructs Docker to pull the official Node.js image with the tag `20`. This image contains the Node.js runtime environment.

## 2. `WORKDIR /app`

This instruction sets the working directory inside the Docker container to `/app`. Subsequent instructions will be executed relative to this directory.

## 3. `COPY . .`

This instruction copies all files and directories from the current directory on the host (where the Docker build context is located) to the `/app` directory inside the Docker container.

## 4. `RUN npm i`

This instruction runs the `npm install` command inside the Docker container. It installs the dependencies listed in the `package.json` file of the application.

## 5. `RUN npx prisma generate`

This instruction runs the Prisma CLI command `npx prisma generate` inside the Docker container. Prisma is a modern database toolkit used for database access in Node.js applications. This command generates Prisma client code based on your Prisma schema.

## 6. `RUN npm run build`

This instruction runs the `npm run build` command inside the Docker container. It typically compiles TypeScript code, bundles assets, or performs any other build steps defined in the `scripts` section of the `package.json` file.

## 7. `CMD ["node", "dist/index.js"]`

This instruction specifies the default command to run when a container is started from this Docker image. It runs the Node.js application entry point, which is typically the `index.js` file located in the `dist` directory after the build step.

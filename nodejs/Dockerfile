# We make use of ARG to set some variables that we
# can use in the Dockerfile
ARG node_version=14
ARG node_image=node:${node_version}-alpine

# STAGE 1: This is the "builder" stage where we build the
# application and give this step a name: "builder"
FROM $node_image as builder

ENV NODE ENV=production
WORKDIR/app

COPY ["package.json", "package-lock.json", "./"]

# compared to the first example we now install
# _all_ dependencies including devDependencies
RUN npm install

# copy the source
COPY /src .

# now build the app
RUN npm build
# and start the app
CMD ["node", "server. js"]


# STAGE 2: in this stage, we reduce the size of the
# image by only installing production dependencies
FROM $node_image as production

WORKDIR /app/

# install _only production_ dependencies to keep the
# docker image small
COPY --from=builder /app/package.json /app/package-lock.json ./
RUN npm install --production

# copy the build from the first stage (e.g. the dist folder)
COPY --from=builder /app/dist ./dist

# and start the bundled app
CMD ["node", "dist/index. js"]

# Use a tiny Linux base image
FROM alpine:3.18

# Optional: add a file
RUN echo "Hello Jenkins Docker Build!" > /hello.txt

# Default command when container starts
CMD ["cat", "/hello.txt"]

# pipetest

```bash
echo "Hello World!" | php -r 'pipe_assert_equals("Hello World!");'
```


```Dockerfile
RUN echo "auto_prepend_file = /var/www/html/vendor/javanile/pipetest/pipetest.php;" \
    > /usr/local/etc/php/conf.d/pipetest.ini
```

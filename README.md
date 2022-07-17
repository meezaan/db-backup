## Buld Container
Copy rclone.conf.template to rclone.conf and update it with your config. This would include multiple items, including s3, Google Drive, OneDrive,
etc.

Then:


```
docker build . -t rc
```

Then:

```
docker run -e DBTYPE=pgsql -e USER=keycloak -e PASSWORD=keycloak -e DBNAME=keycloak -e HOST=localhost -e PORT=5432 -e RCLONEPATH="s3provider:/path-to-backup/" rc
```

K8s Manifest coming soon as an example.

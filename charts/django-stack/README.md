# django-stack Helm Chart

This chart bootstraps a django-stack deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Configuration

The following table lists the configurable parameters of the Django chart and their default values.

| Parameter                                   | Description                                          | Default                             | Type    |
| ------------------------------------------- | ---------------------------------------------------- | ----------------------------------- | ------- |
| `pvc.storageClass`                          | Storage class for PVC                                | `null`                              | String  |
| `django.image.repository`                   | Django container image repository                    | `""`                                | String  |
| `django.image.tag`                          | Django container image tag                           | `""`                                | String  |
| `django.image.pullPolicy`                   | Image pull policy for the Django container           | `IfNotPresent`                      | String  |
| `django.image.imagePullSecrets`             | Specify image pull secrets                           | `[]`                                | Array   |
| `django.workingDir`                         | Working directory for the Django application         | `null`                              | String  |
| `django.replicas`                           | Number of Django pods                                | `1`                                 | Integer |
| `django.autoscaling.enabled`                | Enable autoscaling for Django pods                   | `true`                              | Boolean |
| `django.autoscaling.minReplicas`            | Minimum number of Django pod replicas                | `1`                                 | Integer |
| `django.autoscaling.maxReplicas`            | Maximum number of Django pod replicas                | `3`                                 | Integer |
| `django.autoscaling.cpuTargetPercentage`    | Target CPU utilization percentage for autoscaling    | `80`                                | Integer |
| `django.autoscaling.memoryTargetPercentage` | Target memory utilization percentage for autoscaling | `80`                                | Integer |
| `django.resources.limits.cpu`               | CPU limit for Django pods                            | `"2000m"`                           | String  |
| `django.resources.limits.memory`            | Memory limit for Django pods                         | `"1024Mi"`                          | String  |
| `django.resources.requests.cpu`             | CPU request for Django pods                          | `"300m"`                            | String  |
| `django.resources.requests.memory`          | Memory request for Django pods                       | `"512Mi"`                           | String  |
| `django.secrets`                            | Secrets configuration for Django                     | `{}`                                | Object  |
| `django.ingress.tls.enabled`                | Enable TLS for ingress                               | `true`                              | Boolean |
| `django.ingress.hosts`                      | Hostnames for the ingress                            | `[]`                                | Array   |
| `django.migrations.enabled`                 | Enable or disable Django migrations                  | `true`                              | Boolean |
| `django.statics.enabled`                    | Enable serving static files                          | `true`                              | Boolean |
| `django.statics.storage`                    | Storage size for static files                        | `1Gi`                               | String  |
| `django.statics.mountPath`                  | Mount path for static files                          | `/mnt/statics`                      | String  |
| `django.medias.enabled`                     | Enable serving media files                           | `true`                              | Boolean |
| `django.medias.storage`                     | Storage size for media files                         | `1Gi`                               | String  |
| `django.medias.mountPath`                   | Mount path for media files                           | `/mnt/medias`                       | String  |
| `nginx.image.repository`                    | Nginx container image repository                     | `nginx`                             | String  |
| `nginx.image.tag`                           | Nginx container image tag                            | `1.25.1-alpine3.17`                 | String  |
| `nginx.image.pullPolicy`                    | Image pull policy for the Nginx container            | `IfNotPresent`                      | String  |
| `celery.enabled`                            | Enable Celery workers                                | `true`                              | Boolean |
| `celery.application`                        | Celery application name                              | `celery_app`                        | String  |
| `celery.workers`                            | Configuration for Celery workers                     | `[See values.yaml]`                 | Array   |
| `celery.beat.enabled`                       | Enable Celery beat                                   | `true`                              | Boolean |
| `celery.beat.resources`                     | Resources for Celery beat                            | `[See values.yaml]`                 | Object  |
| `postgresql.enabled`                        | Enable PostgreSQL                                    | `true`                              | Boolean |
| `postgresql.image`                          | PostgreSQL container image                           | `postgres:15.3-alpine3.18`          | String  |
| `postgresql.storage`                        | Storage size for PostgreSQL                          | `1Gi`                               | String  |
| `postgresql.username`                       | PostgreSQL username                                  | `ngc-user`                          | String  |
| `postgresql.password`                       | PostgreSQL password                                  | `ngc-password`                      | String  |
| `postgresql.database`                       | PostgreSQL database name                             | `main`                              | String  |
| `postgresql.resources`                      | Resources for PostgreSQL                             | `[See values.yaml]`                 | Object  |
| `redis.enabled`                             | Enable Redis                                         | `true`                              | Boolean |
| `redis.image`                               | Redis container image                                | `redis:7.0.11-alpine3.18`           | String  |
| `redis.storage`                             | Storage size for Redis                               | `1Gi`                               | String  |
| `redis.resources`                           | Resources for Redis                                  | `[See values.yaml]`                 | Object  |
| `rabbitmq.enabled`                          | Enable RabbitMQ                                      | `true`                              | Boolean |
| `rabbitmq.image`                            | RabbitMQ container image                             | `rabbitmq:3.12.1-management-alpine` | String  |
| `rabbitmq.storage`                          | Storage size for RabbitMQ                            | `1Gi`                               | String  |
| `rabbitmq.username`                         | RabbitMQ username                                    | `django-user`                       | String  |
| `rabbitmq.password`                         | RabbitMQ password                                    | `django-user`                       | String  |
| `rabbitmq.vhost`                            | RabbitMQ virtual host                                | `django-user`                       | String  |
| `rabbitmq.management.enabled`               | Enable RabbitMQ management                           | `true`                              | Boolean |
| `rabbitmq.resources`                        | Resources for RabbitMQ                               | `[See values.yaml]`                 | Object  |

## Scalability

You can scale your Django application by adjusting the replicas parameter under the django section in values.yaml.

## Autoscaling

The chart supports autoscaling using Kubernetes Horizontal Pod Autoscaler. Configure autoscaling parameters under the django.autoscaling and celery.workers.autoscaling sections.

## Persistence

Persistent Volume Claims are used for storage. Adjust the size and storage class as needed.

## Security

This chart includes support for TLS and secrets management. Refer to the values.yaml for configuring these options.

## Dependencies

* PostgreSQL
* Redis
* RabbitMQ
* Celery
* Nginx

These dependencies are configurable through the chart's values.yaml.

## Contributing

Contributions to the chart are welcome. Please follow the standard procedures for submitting issues and pull requests to this repository.

## License

[MIT License](./LICENSE).

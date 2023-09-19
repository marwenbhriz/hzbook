#!/bin/bash

# AUTOMATE SCRIPT FOR HZBOOK/PYTHON PROGRAMS
set -e

APP_NAME=${APP_NAME:-hzbook}
ENV=${ENV:-dev}
DEV_PS="$APP_NAME"

print () {
    echo "-->> $1"
}

start () {
    python3 manage.py runserver
}

build_push_az () {
    ACR_NAME=${ACR_NAME:-$1}
    TAG=${TAG:-$2}

    if [[ -z ${ACR_NAME} ]] || [[ -z ${TAG} ]] ; then
        echo 'missing arguments'
        exit 1
    fi

    docker build -t ${ACR_NAME}.azurecr.io/${APP_NAME}:${TAG} --file=./docker/app/Dockerfile .

    docker push ${ACR_NAME}.azurecr.io/${APP_NAME}:${TAG}
}


deploy_az () {
    ACR_NAME=${ACR_NAME:-hzbook}
    TAG=${TAG:-latest}
    APP_ENV=${APP_ENV:-$1}

    if [[ -z ${APP_ENV} ]] ; then
        echo 'missing arguments'
        exit 1
    fi

    case $APP_ENV in
        dev | production)
            ENVVARS_ENV=$APP_ENV
            ;;
        *)
            echo 'allowed values for $APP_ENV: [dev|production]'
            exit 1
            ;;
    esac

    MANIFESTS=$(helm template $APP_NAME ./helm/${APP_NAME} \
        --set image.tag=$TAG --set image.repository=${ACR_NAME}.azurecr.io/${APP_NAME} \
        --set envVars.ENV=$ENVVARS_ENV)
    
    echo "$MANIFESTS"
    echo
    read -p "Do you want to deploy (Y/N)? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "$MANIFESTS" | kubectl apply -f -
    fi
}

generate_k8s_config () {
    mkdir -p ./docker/k8s/secrets
    CONFIG_ENV_FILE=${CONFIG_ENV_FILE:-.env}

    export CONFIG_ENV=$(sed 's/^/    /' ./${CONFIG_ENV_FILE})

    cat > ./docker/k8s/secrets/hzbook-secrets.yml <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: hzbook-secrets
  labels:
    app: hzbook
    component: microservice
    role: hzbook
stringData:
  $CONFIG_ENV_FILE: |-
$CONFIG_ENV
EOF
}

$*

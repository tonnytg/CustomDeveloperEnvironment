# O que funcionou
# DOC: https://argoproj.github.io/argo-cd/user-guide/commands/argocd_app_create/
# DOC: https://argoproj.github.io/argo-cd/operator-manual/server-commands/argocd-util_config_app/

# My List Charts https://github.com/tonnytg/charts-repo
LIST="grafana jenkins"

if [ $1 == "create" ]
then
    for APP in $LIST
    do
        echo ${APP}
        argocd app create ${APP}-argo --validate --sync-policy 'auto' --repo https://github.com/tonnytg/charts-repo --path ${APP}/helm-chart --dest-namespace default --dest-server https://kubernetes.default.svc
    done
fi

if [ $1 == "delete" ]
then
    for APP in $LIST
    do
        echo ${APP}
        argocd app delete ${APP}-argo -y
    done
fi

DOMAIN="Core AWS Infra Backbone"

printf "Deploying all dev infrastructure for $DOMAIN."
cd dev

cd core-sns
bash local-dev-deloyment.sh
cd ..

cd s3-data-lake
bash local-dev-deployment.sh
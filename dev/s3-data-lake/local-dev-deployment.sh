ENV="dev"
DOMAIN="Core AWS Infra Backbone"
SERVICE="S3-Data-Lake"

printf "Deploying '$DOMAIN - $SERVICE' to $ENV."

terragrunt init --terragrunt-non-interactive
terragrunt apply --terragrunt-non-interactive

printf "Done."
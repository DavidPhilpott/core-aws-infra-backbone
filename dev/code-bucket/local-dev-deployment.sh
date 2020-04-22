ENV="dev"
DOMAIN="Core AWS Infra Backbone"
SERVICE="Code-Bucket"

printf "Deploying '$DOMAIN - $SERVICE' to $ENV."

terragrunt init --terragrunt-non-interactive
terragrunt apply --terragrunt-non-interactive -auto-approve

printf "Done."
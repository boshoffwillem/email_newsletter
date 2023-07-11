param(
    [Parameter(HelpMessage="Skip Docker")]
    [switch]$SkipDocker = $False
)

if (!(Get-Command sqlx))
{
  return
}
# if (!(Get-Command psql))
# {
#   return
# }

$DB_USER = $Env:POSTGRES_USER
if (-not $DB_USER) {
  $DB_USER = "postgres"
}

$DB_PASSWORD = $Env:POSTGRES_PASSWORD
if (-not $DB_PASSWORD) {
  $DB_PASSWORD = "password"
}

$DB_NAME = $Env:POSTGRES_DB
if (-not $DB_NAME) {
  $DB_NAME = "newsletter"
}

$DB_PORT = $Env:POSTGRES_PORT
if (-not $DB_PORT) {
  $DB_PORT = 5432
}

$DB_HOST = $Env:POSTGRES_HOST
if (-not $DB_HOST) {
  $DB_HOST = "localhost"
}

Write-Host $DB_USER
Write-Host $DB_PASSWORD
Write-Host $DB_NAME
Write-Host $DB_PORT
Write-Host $DB_HOST

if (!$SkipDocker) {
  docker container run `
    --name postgres `
    -e POSTGRES_USER=$DB_USER `
    -e POSTGRES_PASSWORD=$DB_PASSWORD `
    -e POSTGRES_DB=$DB_NAME `
    -p 5432:5432 `
    -d `
    postgres `
    postgres -N 1000
}

[System.Environment]::SetEnvironmentVariable('DATABASE_URL',
    'postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}')
sqlx database create
sqlx migrate run

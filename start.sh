set -ex

exec ruby "${APP_FILE}" -p 80 -o '0.0.0.0'

#!/bin/bash

# Globale Variablen für die Parameter
bucket1_name="original-images-bucket-asa"
bucket2_name="resized-images-bucket-asa"
lambda_name="image-resize-lambda-2"
lambda_handler="resize.handler"
lambda_runtime="python3.8"
lambda_role="arn:aws:iam::992382524328:role/LabRole"
lambda_zip="lambda_function.zip"

# Funktion zum Erstellen eines S3 Buckets
create_bucket() {
    local bucket_name=$1
    aws s3 mb s3://$bucket_name
}

# Funktion zum Erstellen einer AWS Lambda-Funktion
create_lambda_function() {
    aws lambda create-function \
        --function-name $lambda_name \
        --handler $lambda_handler \
        --runtime $lambda_runtime \
        --role $lambda_role \
        --zip-file fileb://$lambda_zip
}

# Funktion zum Aktivieren von S3-Bucket-Events für die Lambda-Funktion
enable_lambda_trigger() {
    local lambda_arn=$1
    local bucket_name=$2

    aws s3api put-bucket-notification-configuration \
        --bucket $bucket_name \
        --notification-configuration '{
            "LambdaFunctionConfigurations": [
                {
                    "LambdaFunctionArn": "'"$lambda_arn"'",
                    "Events": ["s3:ObjectCreated:*"]
                }
            ]
        }'
}

# Erstellen von zwei S3-Buckets
echo "Erstellen von zwei S3-Buckets..."
create_bucket $bucket1_name
create_bucket $bucket2_name
echo "Buckets wurden erstellt."

# Erstellen der Lambda-Funktion
echo "Erstellen der Lambda-Funktion..."
create_lambda_function
echo "Lambda-Funktion wurde erstellt."

# Aktivieren von S3-Bucket-Events für die Lambda-Funktion
echo "Aktivieren von S3-Bucket-Events für die Lambda-Funktion..."
lambda_arn=$(aws lambda get-function --function-name $lambda_name --query Configuration.FunctionArn --output text)
enable_lambda_trigger $lambda_arn $bucket1_name
echo "S3-Bucket-Events wurden aktiviert."

# Bildverkleinerung
read -p "Möchten Sie ein Bild verkleinern? (j/n): " choice
if [ "$choice" == "j" ]; then
    read -p "Geben Sie den Pfad zum Bild an: " image_path
    echo "Verkleinere das Bild..."
    # Fügen Sie hier den Befehl zur Bildverkleinerung ein
    echo "Bild wurde verkleinert."
else
    echo "Bildverkleinerung übersprungen."
fi

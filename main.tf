resource "aws_kms_key" "key1" {
    description = "my key1"
  
}
resource "aws_kms_alias" "key1-alias" {
    name          = "alias/key1"
    target_key_id = aws_kms_key.key1.key_id  
}

resource "aws_secretsmanager_secret" "topsecret1" {
    name        = "topsecret1"
    description = "My secret description"
    kms_key_id  = aws_kms_key.key1.key_id
    # secret_string = "my_secret_value"
}

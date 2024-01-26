from jsonschema import validate, Draft7Validator, ValidationError
import json

# Define the JSON Schema
schema = {
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "properties": {
        "status": { "type": "string" },
        "lastActiveDate": { "type": "string", "format": "date" }
    },
    "if": {
        "properties": { "status": { "const": "active" } }
    },
    "then": {
        "required": ["lastActiveDate"],
        "properties": {
            "lastActiveDate": { "type": "string", "format": "date" }
        }
    }
}

# JSON data to validate
data_active = {
    "status": "active",
    "lastActiveDate": "abcd"
}

data_inactive = {
    "status": "inactive"
}

# Function to validate data
def validate_data(data):
    try:
        Draft7Validator(schema).validate(data)
        print("Valid data.")
    except ValidationError as e:
        print("Invalid data:", e.message)

# Validate both sets of data
validate_data(data_active)  # Should be valid
validate_data(data_inactive)  # Should also be valid, since `lastActiveDate` is not required if `status` is not `active`

package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformHelloWorldExample(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	vpc_id := terraform.Output(t, terraformOptions, "vpc_id")

	vpc := aws.GetVpcById(t, vpc_id, "us-east-2")
	assert.Equal(t, vpc.Id, vpc_id)
	assert.Equal(t, "draft-vpc", vpc.Name)
	assert.Equal(t, 6, len(vpc.Subnets))
}

package main_test

import (
	"context"
	"github.com/palo-blog/myproject/hello"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestHandler(t *testing.T) {
	ctx := context.Background()
	response, err := main.Handler(ctx)
	assert.Nil(t, err)
	assert.Equal(t, "{\"message\":\"Go Serverless v1.0! Your function executed successfully!\"}", response.Body)
}

#include "string_stack.h"
#include <string.h>

struct _Stack {
    char *internalArray[];
    int *maxSize;
};

stack_response create() {
    stack_response stackResponse;
    
    int *maxSizePtr = (int*)malloc(sizeof(int));
    *maxSizePtr = 16;

    char *internalArrayPtr[] = (char*)malloc(*maxSizePtr * sizeof(char*));
    
    _Stack *newStack = (_Stack*)malloc(sizeof(*maxSizePtr) + sizeof(*internalArrayPtr));
    
    newStack->internalArray = internalArrayPtr;
    newStack->maxSize = maxSizePtr;
    stackResponse.stack = newStack;

    response_code responseCode = success;
    stackResponse.code = responseCode;
    return stackResponse;
}
#include "string_stack.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct _Stack {
    int* maxSizePtr;
    int* currentSizePtr;
    char** internalArrayPtr;
};

stack_response create() {
    int* newMaxSizePtr = (int*)malloc(sizeof(int));
    *newMaxSizePtr = 16;

    int* currentSizePtr = (int*)malloc(sizeof(int));
    *currentSizePtr = 0;

    char** newInternalArrayPtr = (char**)malloc(16 * sizeof(char*));
    
    struct _Stack *newStack = (struct _Stack*)malloc(sizeof(*newStack));
    
    newStack->maxSizePtr = newMaxSizePtr;
    newStack->currentSizePtr = currentSizePtr;
    newStack->internalArrayPtr = newInternalArrayPtr;
    
    return (stack_response) {success, newStack};
}

int size(const stack s) {
    return *s->currentSizePtr;
}

bool is_empty(const stack s) {
    return *s->currentSizePtr == 0;
}

bool is_full(const stack s) {
    return *s->currentSizePtr == MAX_CAPACITY;
}

response_code push(stack s, char* item) {
    if (is_full(s)) {
        return (response_code) stack_full;
    }

    if (strlen(item) > MAX_ELEMENT_BYTE_SIZE) {
        return (response_code) stack_element_too_large;
    }
    
    if (*s->currentSizePtr >= *s->maxSizePtr) {
        char** newInternalArrayPtr = (char**)malloc(*s->maxSizePtr * 2 * sizeof(char*));
        for (int i = 0; i < *s->maxSizePtr; i++) {
            newInternalArrayPtr[i] = s->internalArrayPtr[i];
        }
        char ** oldArrayPtr = s->internalArrayPtr;
        s->internalArrayPtr = newInternalArrayPtr;
        *s->maxSizePtr *= 2;
        free(oldArrayPtr);
    }
    char* itemClone = (char*)malloc(sizeof(item[0])*strlen(item));
    for (int i = 0; i < strlen(item); i++) {
        itemClone[i] = item[i];
    }

    s->internalArrayPtr[*s->currentSizePtr] = itemClone;
    (*s->currentSizePtr)++;

    return (response_code) success;
}

string_response pop(stack s) {
    if (is_empty(s)) {
        return (string_response) {stack_empty, NULL};
    }
    
    char* string = s->internalArrayPtr[*s->currentSizePtr -1];
    s->internalArrayPtr[*s->currentSizePtr -1] = NULL;
    (*s->currentSizePtr) --;

    return (string_response) {success, string};
}

void destroy(stack* s) {
    free((*s)->maxSizePtr);
    free((*s)->currentSizePtr);
    char** internalArrayPtr = (*s)->internalArrayPtr;
    for (int i = 0; i < size(*s); i++) {
        free(internalArrayPtr[i]);
    }
    free(internalArrayPtr);
    free((*s));

    *s = NULL;
    s = NULL;
}
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

    char* itemClone = (char*)malloc(sizeof(*item)*strlen(item));
    for (int i = 0; i < strlen(item); i++) {
        itemClone[i] = item[i];
    }
    itemClone[strlen(item)] = 0;

    s->internalArrayPtr[*s->currentSizePtr] = itemClone;
    (*s->currentSizePtr)++;

    return (response_code) success;
}

string_response pop(stack s) {
    if (is_empty(s)) {
        return (string_response) {stack_empty, NULL};
    }
    
    int stringIndex = *s->currentSizePtr -1;
    int stringSize = strlen(s->internalArrayPtr[stringIndex]);
    static char string[MAX_ELEMENT_BYTE_SIZE];
    for (int i = 0; i < stringSize; i++) {
        string[i] = s->internalArrayPtr[stringIndex][i];
    }
    string[stringSize] = 0;
    free(s->internalArrayPtr[stringIndex]);
    s->internalArrayPtr[stringIndex] = NULL;
    (*s->currentSizePtr)--;

    return (string_response) {success, string};
}

void destroy(stack* s) {
    free((*s)->maxSizePtr);
    free((*s)->currentSizePtr);
    for (int i = 0; i < size(*s); i++) {
        free((*s)->internalArrayPtr[i]);
    }
    free((*s)->internalArrayPtr);
    free((*s));

    *s = NULL;
}
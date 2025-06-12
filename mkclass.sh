#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./mkclass.sh ClassName"
    exit 1
fi

NAME=$1

# Header file
cat > ${NAME}.hpp <<EOF
#ifndef ${NAME^^}_HPP
#define ${NAME^^}_HPP

#include <iostream>
#include <string>

class ${NAME}
{
    public:
        ${NAME}();
        ${NAME}(const ${NAME}& other);
        ${NAME}& operator=(const ${NAME}& other);
        virtual ~${NAME}(); // remove virtual if needed

        // Methods
};

#endif
EOF

# src file
cat > ${NAME}.cpp <<EOF
#include "${NAME}.hpp"

${NAME}::${NAME}()
{
    std::cout << "${NAME} default constructor called" << std::endl;
}

${NAME}::${NAME}(const ${NAME}& other)
{
    std::cout << "${NAME} copy constructor called" << std::endl;
    *this = other;
}

${NAME}& ${NAME}::operator=(const ${NAME}& other)
{
    std::cout << "${NAME} assignment operator called" << std::endl;
    if (this != &other)
    {
        // copy fields/data
    }
    return *this;
}

${NAME}::~${NAME}()
{
    std::cout << "${NAME} destructor called" << std::endl;
}
EOF

chmod 644 ${NAME}.hpp ${NAME}.cpp
echo "Created: ${NAME}.hpp and ${NAME}.cpp"

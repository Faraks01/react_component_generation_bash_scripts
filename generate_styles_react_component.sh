#! /bin/bash

# Creating a directory
mkdir ${COMPONENT_NAME}

# Creating an index file
echo "export { default } from './${COMPONENT_NAME}'" > ${COMPONENT_NAME}/index.js

# Creating a component file
echo "const ${COMPONENT_NAME} = ({}) => {
    return null
}

export default ${COMPONENT_NAME}" > ${COMPONENT_NAME}/${COMPONENT_NAME}.js
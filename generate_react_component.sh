#! /bin/bash

# Creating a directory
mkdir ${COMPONENT_NAME}

# Creating an index file
echo -e "export { default } from \"./${COMPONENT_NAME}\";" > ${COMPONENT_NAME}/index.js

# Creating a component file
echo -e "import React from \"react\";
import c from \"./${COMPONENT_NAME}.module.scss\";

const ${COMPONENT_NAME} = (props) => {
    const {

    } = props;

    return null
}

export default ${COMPONENT_NAME}" > ${COMPONENT_NAME}/${COMPONENT_NAME}.js

# Creating a styles file
touch ${COMPONENT_NAME}/${COMPONENT_NAME}.module.scss
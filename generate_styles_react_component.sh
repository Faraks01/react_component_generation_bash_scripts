#! /bin/bash

# Creating a directory
mkdir ${COMPONENT_NAME}

# Creating an index file
echo "export { default } from \"./${COMPONENT_NAME}\";" > ${COMPONENT_NAME}/index.ts

# Creating a component file
echo "import React, {FC} from \"react\";
import {${COMPONENT_NAME}Props} from \"./${COMPONENT_NAME}.types\";

const ${COMPONENT_NAME}: FC<${COMPONENT_NAME}Props> = (props) => {
    const {

    } = props;

    return null
}

export default \"${COMPONENT_NAME}\"" > ${COMPONENT_NAME}/${COMPONENT_NAME}.tsx

# Creating a types file
echo "export interface ${COMPONENT_NAME}Props {

}" > ${COMPONENT_NAME}/${COMPONENT_NAME}.types.tsx
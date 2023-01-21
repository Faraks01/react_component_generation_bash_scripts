#! /bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Enter a component name"
read COMPONENT_NAME
echo -e "Your component name is: $COMPONENT_NAME \n"

useTemplate ()
{
    if [ -d "$COMPONENT_NAME" ]
    then
        rm -rf $COMPONENT_NAME
    fi

    export COMPONENT_NAME
    $1
}

echo "Which component you want to create?"
select variant in Component Component\ without\ props Styless\ Component Styless\ Component\ without\ props
do
    case $variant in
    Component)
    useTemplate $SCRIPT_DIR/generate_react_component.sh
    break;;
    Component\ without\ props)
    useTemplate $SCRIPT_DIR/generate_react_component_without_props.sh
    break;;
    Styless\ Component)
    useTemplate $SCRIPT_DIR/generate_styles_react_component.sh
    break;;
    Styless\ Component\ without\ props)
    useTemplate $SCRIPT_DIR/generate_styles_react_component_without_props.sh
    break;;
    *)
    echo "Select valid option, please!";;
    esac
done

echo "Component created!"
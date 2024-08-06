#! /bin/bash

SCRIPT_DIR=$(dirname "$0")

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

COMPONENT_TYPE=""

echo "Select component type"
select type in JS TS
do
    case $type in
    JS)
    COMPONENT_TYPE="JS"
    break;;
    TS)
    COMPONENT_TYPE="TS"
    break;;
    *)
    echo "Select valid option, please!";;
    esac
done

echo "Which component you want to create?"
select variant in Component Component\ without\ props Styless\ Component Styless\ Component\ without\ props
do
    case $variant in
    Component)
      if [ "$COMPONENT_TYPE" = "TS" ];
      then
        useTemplate $SCRIPT_DIR/generate_ts_react_component.sh
      else
        useTemplate $SCRIPT_DIR/generate_react_component.sh
      fi
    break;;
    Component\ without\ props)
      if [ "$COMPONENT_TYPE" = "TS" ];
      then
        useTemplate $SCRIPT_DIR/generate_ts_react_component_without_props.sh
      else
        useTemplate $SCRIPT_DIR/generate_react_component_without_props.sh
      fi
    break;;
    Styless\ Component)
      if [ "$COMPONENT_TYPE" = "TS" ];
      then
        useTemplate $SCRIPT_DIR/generate_styles_ts_react_component.sh
      else
        useTemplate $SCRIPT_DIR/generate_styles_react_component.sh
      fi
    break;;
    Styless\ Component\ without\ props)
      if [ "$COMPONENT_TYPE" = "TS" ];
      then
        useTemplate $SCRIPT_DIR/generate_styles_ts_react_component_without_props.sh
      else
        useTemplate $SCRIPT_DIR/generate_styles_react_component_without_props.sh
      fi
    break;;
    *)
    echo "Select valid option, please!";;
    esac
done

echo "Fixing generated component with eslint fix"
npx eslint --fix $COMPONENT_NAME

echo "Adding component to git"
git add $COMPONENT_NAME

echo "Component created!"
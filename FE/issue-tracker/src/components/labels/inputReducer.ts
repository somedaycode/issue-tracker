export type inputInitialType = {
  title: string;
  description: string;
  color_code: string;
};

type actionType = {
  type: 'TITLE' | 'DESCRIPTION' | 'COLOR';
  newState: string;
};

export const inputReducer = (state: inputInitialType, action: actionType) => {
  switch (action.type) {
    case 'TITLE': {
      return {
        ...state,
        title: action.newState,
      };
    }
    case 'DESCRIPTION': {
      return {
        ...state,
        description: action.newState,
      };
    }
    case 'COLOR': {
      return {
        ...state,
        color_code: action.newState,
      };
    }
  }
};

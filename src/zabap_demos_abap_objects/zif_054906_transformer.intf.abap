INTERFACE zif_054906_transformer
  PUBLIC.

  TYPES ty_transformed TYPE c LENGTH 1.

  METHODS is_transformed RETURNING VALUE(result) TYPE ty_transformed.
  METHODS transform.

ENDINTERFACE.

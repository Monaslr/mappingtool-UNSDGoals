# SDP2024-Group2 Coding Convention

## Introduction

This document serves as a record of the coding standards and conventions we agreed to adhere to in our meeting on May 18, 2024. It is open for update,pending further discussion and agreement by majority vote or, in the case of a two way tie (2 vs 2), coin flip.

## Naming Convention

### React JavaScript
- **Variable Names** - camelCase
- **Components** - PascalCase
- **Global Constants** - ALLCAPS
- **Indentation** - Use tabs, not spaces.
- **Formatting** - Starting curly braces should be on a new line.
    ```
    Like()
    {
        this
    }
    ```
### MySQL
- All keys will be identified via the suffix '**_id**', e.g., the primary key for the table '**project**' would be '**project_id**'.
- All foreign keys will be created using the table names of the tables being connected, e.g., 'project' and 'goal' tables would be linked via the key '**project_goal_id**'.
- Queries will be written in ALLCAPS.

## Conclusion

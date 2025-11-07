# Snowflake Cortex Agent Callout from Agentforce Agent

Have you ever had a converation with Agentforce, and thought to yourself, "What if I asked this question to Snowflake's Cortex Agent?" - well now you can. With an Apex Invocable method calling out to Snowflake's Cortex Agent's REST API it'll be like both agents are in the room with you (except it'll be like having Agentforce as a translator) answering your questions.

# Setup Process

Before using this code, you'll want to make sure you have the following
1. Working Snowflake Cortex Agent
2. PAT
3. URL from Snowflake with your Account ID and Org ID in the base URL

## Make sure to update in the repo for your use

1. URL in the Named Credential, replace the `ACCOUNT_IDENTIFIER_GOES_HERE` portion of the url, as well as the parameters of the URL with your schema, agent, and account identifier information from Snowflake
2. PAT token in the External Credential, you will need to create a PAT for yourself or the admin user in Snowflake that the code will use when calling Snowflake

## Setting up the Snowflake Cortex Agent

1. I primarily followed this guide here to get the sample data as well as setup the Cortex Search Service - https://www.snowflake.com/en/developers/guides/getting-started-with-snowflake-mcp-server/?index=..%2F..index
2. Once the Cortex Search Service, I created a new Agent and tied the Cortex Search Service from before to that agent
3. Creating the PAT requires a Network Policy as well, these two can be created in the Snowflake UI depending on what kind of Network Security you'd like to set for yourself

## Setting up Salesforce

1. Deploy the base metadata

```bash
sf project deploy start
```

1. Assign yourself the permission set to the External Credential

```bash
sf org assign permset -n SnowflakeTrialPAT
```

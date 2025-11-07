public with sharing class SnowflakeCortexAgentREST {
    @AuraEnabled(cacheable=false)
    public static String calloutToCortex(String message, Integer threadId, Integer parentMessageId){
        if (threadId == null) threadId = 0;
        if (parentMessageId == null) parentMessageId = 0;

        try {
            HttpRequest req = new HttpRequest();
            // calling dashmcpagent
            // /api/v2/databases/dash_mcp_db/schemas/data/agents/dashmcpagent:run
            req.setEndpoint('callout:SnowflakeTrialDashAgent');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json');
            req.setHeader('Accept', 'application/json, text/event-stream');

            String jsonBody = '{' +
                // '"thread_id": ' + threadId + ',' +
                '"parent_message_id": ' + parentMessageId + ',' +
                '"messages": [{' +
                    '"role": "user",' +
                    '"content": [{' +
                        '"type": "text",' +
                        '"text": "' + message + '"' +
                    '}]' +
                '}],' +
                '"tool_choice": {' +
                    '"type": "auto"' +
                '}' +
            '}';
            req.setBody(jsonBody);

            Http http = new Http();
            HTTPResponse res = http.send(req);
            System.debug('Cortex Response: ' + res.getBody());
            return res.getBody();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());

        }
    }
}
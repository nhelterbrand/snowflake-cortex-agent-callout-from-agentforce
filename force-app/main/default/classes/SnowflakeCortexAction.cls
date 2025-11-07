public with sharing class SnowflakeCortexAction {
    @InvocableMethod(label='Call Cortex' description='Calls Snowflake Cortex with a message')
    public static List<CortexResponse> callCortex(List<CortexThread> requests) {
        List<CortexResponse> responses = new List<CortexResponse>();
        for (CortexThread request : requests) {
            String response = SnowflakeCortexAgentREST.calloutToCortex(request.message, request.threadId, request.parentMessageId);
            CortexResponse cortexResponse = new CortexResponse();
            cortexResponse.response = response;
            responses.add(cortexResponse);
        }
        return responses;
    }

    public class CortexThread {
        @InvocableVariable(label='Thread ID' description='ID of the Cortex thread')
        public Integer threadId;

        @InvocableVariable(label='Parent Message ID' description='ID of the parent message in the thread')
        public Integer parentMessageId;

        @InvocableVariable(label='Message' description='Message content to send to Cortex')
        public String message;
    }

    public class CortexResponse {
        @InvocableVariable(label='Response' description='Response from Cortex')
        public String response;
    }
}
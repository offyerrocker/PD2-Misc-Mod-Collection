local lastExecutionTime = 0

Hooks:PostHook(HostNetworkSession, "on_peer_sync_complete", "host_informvr", function(self, peer, peer_id)
    if _G.IS_VR then
        DelayedCalls:Add("VR_message_delay", 5, function()
            local currentTime = os.time()
            if (currentTime - lastExecutionTime) >= 5 then
                managers.chat:send_message(1, managers.network:session():local_peer(), "[Identify VR Players Mod] I am using VR")
                lastExecutionTime = currentTime
            end
        end)
    end
end)
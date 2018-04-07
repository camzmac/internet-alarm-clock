local fsm = {} 

--FSM module code (github.com/cornelisse/LuaFSM)

-- FSM CONSTANTS --------------------------------------------------------------
SEPARATOR = '.'
ANY       = '*'
ANYSTATE  = ANY .. SEPARATOR
ANYEVENT  = SEPARATOR .. ANY
UNKNOWN   = ANYSTATE .. ANY

function fsm.new(t)
    
    local self = {}
    
    -- ATTRIBUTES -------------------------------------------------------------
    local state = t[1][1]   -- current state, default the first one
    local stt = {}          -- state transition table
    local str = ""          -- <state><SEPARATOR><event> combination
    local silence = true   -- use silent() for whisper mode
        
    -- METHODS ---------------------------------------------------------------- 
    
    -- some getters and setters
    function self:set(s) state = s end
    function self:get() return state    end
    function self:silent() silence = true end

    -- default exception handling
    local function exception() 
        if silence == false then 
            print("FSM: unknown combination: " .. str) end
        return false
    end 
    
    -- respond based on current state and event
    function self:fire(event)
        local act = stt[state .. SEPARATOR .. event]
        -- raise exception for unknown state-event combination
        if act == nil then 
            -- search for wildcard "states" for this event
            act = stt[ANYSTATE .. event]
        --CM 19 Apr 2017: modified code to prevent undefined events from arbitrarily changing the state to the first on the table
        end
        if act ~= nil then
            -- set next state as current state
            state = act.newState
            print("Prior to transition to "..state..": "..node.heap())
            act.action()
            print("After transition to "..state..": "..node.heap())
        end
    end

    -- add new state transitions to the FSM
    function self:add(t)
        for _,v in ipairs(t) do
            local oldState, event, newState, action = v[1], v[2], v[3], v[4]      
            stt[oldState .. SEPARATOR .. event] = {newState = newState, action = action}
        end
        return #t   -- the requested number of state-transitions to be added 
    end
    
    -- remove state transitions from the FSM
    function self:delete(t)
        for _,v in ipairs(t) do
            local oldState, event = v[1], v[2]
            if oldState == ANY and event == ANY then
                if not silence then
                    print( "FSM: you should not delete the exception handler" )
                    print( "FSM: but assign another exception action" )
                end 
                -- assign default exception handler but stay in current state
                stt[exception] = {newState = state, action = exception}
            else
                stt[oldState .. SEPARATOR .. event] = nil
            end
        end
        return #t   -- the requested number of state-transitions to be deleted
    end
    
    -- initalise state transition table
    stt[UNKNOWN] = {newState = state, action = exception}
    
    self:add(t)

    -- return FSM methods
    return self
end

return fsm

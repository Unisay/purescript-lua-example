return {
    showIntImpl = function(n) return tostring(n) end,
    showNumberImpl = function(n) return tostring(n) end,
    showCharImpl = function(n)
        local code = n:byte()
        if code < 0x20 or code == 0x7F then
            if n == "\x07" then return "'\\a'" end
            if n == "\b" then return "'\\b'" end
            if n == "\f" then return "'\\f'" end
            if n == "\n" then return "'\\n'" end
            if n == "\r" then return "'\\r'" end
            if n == "\t" then return "'\\t'" end
            if n == "\v" then return "'\\v'" end
            return "'\\" .. code:toString(10) .. "'"
        end
        if n == "'" or n == "\\" then return "'\\" .. n .. "'" end
        return "'" .. n .. "'"
    end,

    --[[ 
        export const showStringImpl = function (s) {
        var l = s.length;
        return "\"" + s.replace(
            /[\0-\x1F\x7F"\\]/g, // eslint-disable-line no-control-regex
            function (c, i) {
            switch (c) {
                case "\"":
                case "\\":
                return "\\" + c;
                case "\x07": return "\\a";
                case "\b": return "\\b";
                case "\f": return "\\f";
                case "\n": return "\\n";
                case "\r": return "\\r";
                case "\t": return "\\t";
                case "\v": return "\\v";
            }
            var k = i + 1;
            var empty = k < l && s[k] >= "0" && s[k] <= "9" ? "\\&" : "";
            return "\\" + c.charCodeAt(0).toString(10) + empty;
            }
        ) + "\"";
        };
    ]]

    showStringImpl = function(s)
        return s -- TODO
    end,
    showArrayImpl = function(f)
        return function(xs)
            local l = #xs
            local ss = {}
            for i = 1, l do ss[i] = f(xs[i - 1]) end
            return "[" .. table.concat(ss, ",") .. "]"
        end
    end

}

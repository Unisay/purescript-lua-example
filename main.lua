_S___runtime_lazy = function(name)
  return function(init)
    local state = 0
    local val = nil
    return function(lineNumber)
      if state == 2 then
        return val
      elseif state == 1 then
        return error(name .. " was needed before it finished initializing")
      else
        state = 1
        val = init()
        state = 2
        return val
      end
    end
  end
end
local Prim = (function()
  local undefined = nil
  return { undefined = undefined }
end)()
local Control_Semigroupoid = (function()
  local Semigroupoid_S_Dict = function(x_0) return x_0 end
  local semigroupoidFn = {
    compose = function(f_1)
      return function(g_2) return function(x_3) return f_1(g_2(x_3)) end end
    end
  }
  local compose = function(dict_4) local v = dict_4 return v.compose end
  local composeFlipped = function(dictSemigroupoid_5)
    local compose1 = compose(dictSemigroupoid_5)
    return function(f_6)
      return function(g_7) return (compose1(g_7))(f_6) end
    end
  end
  return {
    compose = compose,
    composeFlipped = composeFlipped,
    semigroupoidFn = semigroupoidFn
  }
end)()
local Control_Category = (function()
  local Category_S_Dict = function(x_0) return x_0 end
  local identity = function(dict_1) local v = dict_1 return v.identity end
  local categoryFn = {
    identity = function(x_2) return x_2 end,
    Semigroupoid0 = function() return Control_Semigroupoid.semigroupoidFn end
  }
  return { identity = identity, categoryFn = categoryFn }
end)()
local Data_Boolean = (function()
  local otherwise = true
  return { otherwise = otherwise }
end)()
local Type_Proxy = (function()
  local Proxy = function() return { ["$ctor"] = "Type_Proxy.Proxy" } end
  return { Proxy = Proxy }
end)()
local Data_Symbol = (function()
  local foreign = (function()
    return { unsafeCoerce = function(a) return a end }

  end)()
  local unsafeCoerce = foreign.unsafeCoerce
  local IsSymbol_S_Dict = function(x_0) return x_0 end
  local reifySymbol = function(s_1)
    return function(f_2)
      local coerce = unsafeCoerce
      return ((coerce(function(dictIsSymbol_3)
        return f_2(dictIsSymbol_3)
      end))({ reflectSymbol = function(v_4) return s_1 end }))(Type_Proxy.Proxy)
    end
  end
  local reflectSymbol = function(dict_5)
    local v = dict_5
    return v.reflectSymbol
  end
  return { reflectSymbol = reflectSymbol, reifySymbol = reifySymbol }
end)()
local Data_Unit = (function()
  local foreign = (function() return { unit = nil }  end)()
  local unit = foreign.unit
  return { unit = unit }
end)()
local Record_Unsafe = (function()
  local foreign = (function()
    return {
        unsafeHas = function(l) return function(r) return r[l] ~= nil end end,
        unsafeGet = function(l) return function(r) return r[l] end end,
        unsafeSet = function(l) return function(value) return function(r)
                    local copy = {}
                    for key, val in pairs(r) do
                        copy[key] = val
                    end
                    copy[l] = value
                    return copy
                end
            end
        end,
        unsafeDelete = function(l) return function(r)
                local copy = {}
                for key, val in pairs(r) do if key ~= l then copy[key] = val end end
                return copy
            end
        end
    }

  end)()
  local unsafeHas = foreign.unsafeHas
  local unsafeGet = foreign.unsafeGet
  local unsafeSet = foreign.unsafeSet
  local unsafeDelete = foreign.unsafeDelete
  return {
    unsafeHas = unsafeHas,
    unsafeGet = unsafeGet,
    unsafeSet = unsafeSet,
    unsafeDelete = unsafeDelete
  }
end)()
local Data_HeytingAlgebra = (function()
  local foreign = (function()
    return {
        boolConj = function(b1) return function(b2) return b1 and b2 end end,
        boolDisj = function(b1) return function(b2) return b1 or b2 end end,
        boolNot = function(b) return not b end
    }

  end)()
  local boolConj = foreign.boolConj
  local boolDisj = foreign.boolDisj
  local boolNot = foreign.boolNot
  local HeytingAlgebraRecord_S_Dict = function(x_0) return x_0 end
  local HeytingAlgebra_S_Dict = function(x_1) return x_1 end
  local ttRecord = function(dict_2) local v = dict_2 return v.ttRecord end
  local tt = function(dict_3) local v = dict_3 return v.tt end
  local notRecord = function(dict_4) local v = dict_4 return v.notRecord end
  local _not_ = function(dict_5) local v = dict_5 return v._not_ end
  local impliesRecord = function(dict_6)
    local v = dict_6
    return v.impliesRecord
  end
  local implies = function(dict_7) local v = dict_7 return v.implies end
  local heytingAlgebraUnit = {
    ff = Data_Unit.unit,
    tt = Data_Unit.unit,
    implies = function(v_8) return function(v1_9) return Data_Unit.unit end end,
    conj = function(v_10) return function(v1_11) return Data_Unit.unit end end,
    disj = function(v_12) return function(v1_13) return Data_Unit.unit end end,
    _not_ = function(v_14) return Data_Unit.unit end
  }
  local heytingAlgebraRecordNil = {
    conjRecord = function(v_15)
      return function(v1_16) return function(v2_17) return {} end end
    end,
    disjRecord = function(v_18)
      return function(v1_19) return function(v2_20) return {} end end
    end,
    ffRecord = function(v_21) return function(v1_22) return {} end end,
    impliesRecord = function(v_23)
      return function(v1_24) return function(v2_25) return {} end end
    end,
    notRecord = function(v_26) return function(v1_27) return {} end end,
    ttRecord = function(v_28) return function(v1_29) return {} end end
  }
  local heytingAlgebraProxy = {
    conj = function(v_30)
      return function(v1_31) return Type_Proxy.Proxy end
    end,
    disj = function(v_32)
      return function(v1_33) return Type_Proxy.Proxy end
    end,
    implies = function(v_34)
      return function(v1_35) return Type_Proxy.Proxy end
    end,
    ff = Type_Proxy.Proxy,
    _not_ = function(v_36) return Type_Proxy.Proxy end,
    tt = Type_Proxy.Proxy
  }
  local ffRecord = function(dict_37) local v = dict_37 return v.ffRecord end
  local ff = function(dict_38) local v = dict_38 return v.ff end
  local disjRecord = function(dict_39) local v = dict_39 return v.disjRecord end
  local disj = function(dict_40) local v = dict_40 return v.disj end
  local heytingAlgebraBoolean
  heytingAlgebraBoolean = {
    ff = false,
    tt = true,
    implies = function(a_41)
      return function(b_42)
        return ((disj(heytingAlgebraBoolean))((_not_(heytingAlgebraBoolean))(a_41)))(b_42)
      end
    end,
    conj = boolConj,
    disj = boolDisj,
    _not_ = boolNot
  }
  local conjRecord = function(dict_43) local v = dict_43 return v.conjRecord end
  local heytingAlgebraRecord = function()
    return function(dictHeytingAlgebraRecord_44)
      return {
        ff = ((ffRecord(dictHeytingAlgebraRecord_44))(Type_Proxy.Proxy))(Type_Proxy.Proxy),
        tt = ((ttRecord(dictHeytingAlgebraRecord_44))(Type_Proxy.Proxy))(Type_Proxy.Proxy),
        conj = (conjRecord(dictHeytingAlgebraRecord_44))(Type_Proxy.Proxy),
        disj = (disjRecord(dictHeytingAlgebraRecord_44))(Type_Proxy.Proxy),
        implies = (impliesRecord(dictHeytingAlgebraRecord_44))(Type_Proxy.Proxy),
        _not_ = (notRecord(dictHeytingAlgebraRecord_44))(Type_Proxy.Proxy)
      }
    end
  end
  local conj = function(dict_45) local v = dict_45 return v.conj end
  local heytingAlgebraFunction = function(dictHeytingAlgebra_46)
    local ff1 = ff(dictHeytingAlgebra_46)
    local tt1 = tt(dictHeytingAlgebra_46)
    local implies1 = implies(dictHeytingAlgebra_46)
    local conj1 = conj(dictHeytingAlgebra_46)
    local disj1 = disj(dictHeytingAlgebra_46)
    local not1 = _not_(dictHeytingAlgebra_46)
    return {
      ff = function(v_47) return ff1 end,
      tt = function(v_48) return tt1 end,
      implies = function(f_49)
        return function(g_50)
          return function(a_51) return (implies1(f_49(a_51)))(g_50(a_51)) end
        end
      end,
      conj = function(f_52)
        return function(g_53)
          return function(a_54) return (conj1(f_52(a_54)))(g_53(a_54)) end
        end
      end,
      disj = function(f_55)
        return function(g_56)
          return function(a_57) return (disj1(f_55(a_57)))(g_56(a_57)) end
        end
      end,
      _not_ = function(f_58)
        return function(a_59) return not1(f_58(a_59)) end
      end
    }
  end
  local heytingAlgebraRecordCons = function(dictIsSymbol_60)
    local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_60)
    return function()
      return function(dictHeytingAlgebraRecord_61)
        return (function()
          local conjRecord1 = conjRecord(dictHeytingAlgebraRecord_61)
          local disjRecord1 = disjRecord(dictHeytingAlgebraRecord_61)
          local impliesRecord1 = impliesRecord(dictHeytingAlgebraRecord_61)
          local ffRecord1 = ffRecord(dictHeytingAlgebraRecord_61)
          local notRecord1 = notRecord(dictHeytingAlgebraRecord_61)
          local ttRecord1 = ttRecord(dictHeytingAlgebraRecord_61)
          return function(dictHeytingAlgebra_62)
            return (function()
              local conj1 = conj(dictHeytingAlgebra_62)
              local disj1 = disj(dictHeytingAlgebra_62)
              local implies1 = implies(dictHeytingAlgebra_62)
              local ff1 = ff(dictHeytingAlgebra_62)
              local not1 = _not_(dictHeytingAlgebra_62)
              local tt1 = tt(dictHeytingAlgebra_62)
              return {
                conjRecord = function(v_63)
                  return function(ra_64)
                    return function(rb_65)
                      return (function()
                        local tail = ((conjRecord1(Type_Proxy.Proxy))(ra_64))(rb_65)
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local insert = Record_Unsafe.unsafeSet(key)
                        local get = Record_Unsafe.unsafeGet(key)
                        return (insert((conj1(get(ra_64)))(get(rb_65))))(tail)
                      end)()
                    end
                  end
                end,
                disjRecord = function(v_66)
                  return function(ra_67)
                    return function(rb_68)
                      return (function()
                        local tail = ((disjRecord1(Type_Proxy.Proxy))(ra_67))(rb_68)
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local insert = Record_Unsafe.unsafeSet(key)
                        local get = Record_Unsafe.unsafeGet(key)
                        return (insert((disj1(get(ra_67)))(get(rb_68))))(tail)
                      end)()
                    end
                  end
                end,
                impliesRecord = function(v_69)
                  return function(ra_70)
                    return function(rb_71)
                      return (function()
                        local tail = ((impliesRecord1(Type_Proxy.Proxy))(ra_70))(rb_71)
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local insert = Record_Unsafe.unsafeSet(key)
                        local get = Record_Unsafe.unsafeGet(key)
                        return (insert((implies1(get(ra_70)))(get(rb_71))))(tail)
                      end)()
                    end
                  end
                end,
                ffRecord = function(v_72)
                  return function(row_73)
                    return (function()
                      local tail = (ffRecord1(Type_Proxy.Proxy))(row_73)
                      local key = reflectSymbol(Type_Proxy.Proxy)
                      local insert = Record_Unsafe.unsafeSet(key)
                      return (insert(ff1))(tail)
                    end)()
                  end
                end,
                notRecord = function(v_74)
                  return function(row_75)
                    return (function()
                      local tail = (notRecord1(Type_Proxy.Proxy))(row_75)
                      local key = reflectSymbol(Type_Proxy.Proxy)
                      local insert = Record_Unsafe.unsafeSet(key)
                      local get = Record_Unsafe.unsafeGet(key)
                      return (insert(not1(get(row_75))))(tail)
                    end)()
                  end
                end,
                ttRecord = function(v_76)
                  return function(row_77)
                    return (function()
                      local tail = (ttRecord1(Type_Proxy.Proxy))(row_77)
                      local key = reflectSymbol(Type_Proxy.Proxy)
                      local insert = Record_Unsafe.unsafeSet(key)
                      return (insert(tt1))(tail)
                    end)()
                  end
                end
              }
            end)()
          end
        end)()
      end
    end
  end
  return {
    tt = tt,
    ff = ff,
    implies = implies,
    conj = conj,
    disj = disj,
    _not_ = _not_,
    ffRecord = ffRecord,
    ttRecord = ttRecord,
    impliesRecord = impliesRecord,
    conjRecord = conjRecord,
    disjRecord = disjRecord,
    notRecord = notRecord,
    heytingAlgebraBoolean = heytingAlgebraBoolean,
    heytingAlgebraUnit = heytingAlgebraUnit,
    heytingAlgebraFunction = heytingAlgebraFunction,
    heytingAlgebraProxy = heytingAlgebraProxy,
    heytingAlgebraRecord = heytingAlgebraRecord,
    heytingAlgebraRecordNil = heytingAlgebraRecordNil,
    heytingAlgebraRecordCons = heytingAlgebraRecordCons
  }
end)()
local Data_Void = (function()
  local Void = function(x_0) return x_0 end
  local absurd = function(a_1)
    local spin
    spin = function(v_2)
      return (function() local b = v_2 return spin(b) end)()
    end
    return spin(a_1)
  end
  return { absurd = absurd }
end)()
local Data_Eq = (function()
  local foreign = (function()
    local refEq = function(r1) return function(r2) return r1 == r2 end end
    return {
        refEq = refEq,
        eqBooleanImpl = refEq,
        eqIntImpl = refEq,
        eqNumberImpl = refEq,
        eqCharImpl = refEq,
        eqStringImpl = refEq,
        eqArrayImpl = function(f) return function(xs) return function(ys)
                    local l = #xs
                    if l ~= #ys then return false end
                    for i = 1, l do
                        if not f(xs[i])(ys[i]) then return false end
                    end
                    return true
                end
            end
        end
    }

  end)()
  local eqBooleanImpl = foreign.eqBooleanImpl
  local eqIntImpl = foreign.eqIntImpl
  local eqNumberImpl = foreign.eqNumberImpl
  local eqCharImpl = foreign.eqCharImpl
  local eqStringImpl = foreign.eqStringImpl
  local eqArrayImpl = foreign.eqArrayImpl
  local conj = Data_HeytingAlgebra.conj(Data_HeytingAlgebra.heytingAlgebraBoolean)
  local EqRecord_S_Dict = function(x_0) return x_0 end
  local Eq_S_Dict = function(x_1) return x_1 end
  local Eq1_S_Dict = function(x_2) return x_2 end
  local eqVoid = {
    eq = function(v_3) return function(v1_4) return true end end
  }
  local eqUnit = {
    eq = function(v_5) return function(v1_6) return true end end
  }
  local eqString = { eq = eqStringImpl }
  local eqRowNil = {
    eqRecord = function(v_7)
      return function(v1_8) return function(v2_9) return true end end
    end
  }
  local eqRecord = function(dict_10) local v = dict_10 return v.eqRecord end
  local eqRec = function()
    return function(dictEqRecord_11)
      return { eq = (eqRecord(dictEqRecord_11))(Type_Proxy.Proxy) }
    end
  end
  local eqProxy = {
    eq = function(v_12) return function(v1_13) return true end end
  }
  local eqNumber = { eq = eqNumberImpl }
  local eqInt = { eq = eqIntImpl }
  local eqChar = { eq = eqCharImpl }
  local eqBoolean = { eq = eqBooleanImpl }
  local eq1 = function(dict_14) local v = dict_14 return v.eq1 end
  local eq = function(dict_15) local v = dict_15 return v.eq end
  local eq2 = eq(eqBoolean)
  local eqArray = function(dictEq_16)
    return { eq = eqArrayImpl(eq(dictEq_16)) }
  end
  local eq1Array = {
    eq1 = function(dictEq_17) return eq(eqArray(dictEq_17)) end
  }
  local eqRowCons = function(dictEqRecord_18)
    local eqRecord1 = eqRecord(dictEqRecord_18)
    return function()
      return function(dictIsSymbol_19)
        return (function()
          local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_19)
          return function(dictEq_20)
            return (function()
              local eq3 = eq(dictEq_20)
              return {
                eqRecord = function(v_21)
                  return function(ra_22)
                    return function(rb_23)
                      return (function()
                        local tail = ((eqRecord1(Type_Proxy.Proxy))(ra_22))(rb_23)
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local get = Record_Unsafe.unsafeGet(key)
                        return (conj((eq3(get(ra_22)))(get(rb_23))))(tail)
                      end)()
                    end
                  end
                end
              }
            end)()
          end
        end)()
      end
    end
  end
  local notEq = function(dictEq_24)
    local eq3 = eq(dictEq_24)
    return function(x_25)
      return function(y_26) return (eq2((eq3(x_25))(y_26)))(false) end
    end
  end
  local notEq1 = function(dictEq1_27)
    local eq11 = eq1(dictEq1_27)
    return function(dictEq_28)
      return (function()
        local eq12 = eq11(dictEq_28)
        return function(x_29)
          return function(y_30) return (eq2((eq12(x_29))(y_30)))(false) end
        end
      end)()
    end
  end
  return {
    eq = eq,
    notEq = notEq,
    eq1 = eq1,
    notEq1 = notEq1,
    eqRecord = eqRecord,
    eqBoolean = eqBoolean,
    eqInt = eqInt,
    eqNumber = eqNumber,
    eqChar = eqChar,
    eqString = eqString,
    eqUnit = eqUnit,
    eqVoid = eqVoid,
    eqArray = eqArray,
    eqRec = eqRec,
    eqProxy = eqProxy,
    eq1Array = eq1Array,
    eqRowNil = eqRowNil,
    eqRowCons = eqRowCons
  }
end)()
local Data_Semigroup = (function()
  local foreign = (function()
    return {
        concatString = function(s1) return function(s2) return s1 .. s2 end end,
        concatArray = function(xs) return function(ys)
                if #xs == 0 then return ys end
                if #ys == 0 then return xs end
                return table.concat(xs, ys)
            end
        end
    }

  end)()
  local concatString = foreign.concatString
  local concatArray = foreign.concatArray
  local SemigroupRecord_S_Dict = function(x_0) return x_0 end
  local Semigroup_S_Dict = function(x_1) return x_1 end
  local semigroupVoid = { append = function(v_2) return Data_Void.absurd end }
  local semigroupUnit = {
    append = function(v_3) return function(v1_4) return Data_Unit.unit end end
  }
  local semigroupString = { append = concatString }
  local semigroupRecordNil = {
    appendRecord = function(v_5)
      return function(v1_6) return function(v2_7) return {} end end
    end
  }
  local semigroupProxy = {
    append = function(v_8) return function(v1_9) return Type_Proxy.Proxy end end
  }
  local semigroupArray = { append = concatArray }
  local appendRecord = function(dict_10)
    local v = dict_10
    return v.appendRecord
  end
  local semigroupRecord = function()
    return function(dictSemigroupRecord_11)
      return {
        append = (appendRecord(dictSemigroupRecord_11))(Type_Proxy.Proxy)
      }
    end
  end
  local append = function(dict_12) local v = dict_12 return v.append end
  local semigroupFn = function(dictSemigroup_13)
    local append1 = append(dictSemigroup_13)
    return {
      append = function(f_14)
        return function(g_15)
          return function(x_16) return (append1(f_14(x_16)))(g_15(x_16)) end
        end
      end
    }
  end
  local semigroupRecordCons = function(dictIsSymbol_17)
    local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_17)
    return function()
      return function(dictSemigroupRecord_18)
        return (function()
          local appendRecord1 = appendRecord(dictSemigroupRecord_18)
          return function(dictSemigroup_19)
            return (function()
              local append1 = append(dictSemigroup_19)
              return {
                appendRecord = function(v_20)
                  return function(ra_21)
                    return function(rb_22)
                      return (function()
                        local tail = ((appendRecord1(Type_Proxy.Proxy))(ra_21))(rb_22)
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local insert = Record_Unsafe.unsafeSet(key)
                        local get = Record_Unsafe.unsafeGet(key)
                        return (insert((append1(get(ra_21)))(get(rb_22))))(tail)
                      end)()
                    end
                  end
                end
              }
            end)()
          end
        end)()
      end
    end
  end
  return {
    append = append,
    appendRecord = appendRecord,
    semigroupString = semigroupString,
    semigroupUnit = semigroupUnit,
    semigroupVoid = semigroupVoid,
    semigroupFn = semigroupFn,
    semigroupArray = semigroupArray,
    semigroupProxy = semigroupProxy,
    semigroupRecord = semigroupRecord,
    semigroupRecordNil = semigroupRecordNil,
    semigroupRecordCons = semigroupRecordCons
  }
end)()
local Data_Show = (function()
  local foreign = (function()
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

  end)()
  local showIntImpl = foreign.showIntImpl
  local showNumberImpl = foreign.showNumberImpl
  local showCharImpl = foreign.showCharImpl
  local showStringImpl = foreign.showStringImpl
  local showArrayImpl = foreign.showArrayImpl
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local ShowRecordFields_S_Dict = function(x_0) return x_0 end
  local Show_S_Dict = function(x_1) return x_1 end
  local showVoid = { show = Data_Void.absurd }
  local showUnit = { show = function(v_2) return "unit" end }
  local showString = { show = showStringImpl }
  local showRecordFieldsNil = {
    showRecordFields = function(v_3) return function(v1_4) return "" end end
  }
  local showRecordFields = function(dict_5)
    local v = dict_5
    return v.showRecordFields
  end
  local showRecord = function()
    return function()
      return function(dictShowRecordFields_6)
        local showRecordFields1 = showRecordFields(dictShowRecordFields_6)
        return {
          show = function(record_7)
            return (append("{"))((append((showRecordFields1(Type_Proxy.Proxy))(record_7)))("}"))
          end
        }
      end
    end
  end
  local showProxy = { show = function(v_8) return "Proxy" end }
  local showNumber = { show = showNumberImpl }
  local showInt = { show = showIntImpl }
  local showChar = { show = showCharImpl }
  local showBoolean = {
    show = function(v_9)
      if true == v_9 then
        return "true"
      else
        return (function()
          if false == v_9 then
            return "false"
          else
            return error("No patterns matched")
          end
        end)()
      end
    end
  }
  local show = function(dict_10) local v = dict_10 return v.show end
  local showArray = function(dictShow_11)
    return { show = showArrayImpl(show(dictShow_11)) }
  end
  local showRecordFieldsCons = function(dictIsSymbol_12)
    local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_12)
    return function(dictShowRecordFields_13)
      return (function()
        local showRecordFields1 = showRecordFields(dictShowRecordFields_13)
        return function(dictShow_14)
          return (function()
            local show1 = show(dictShow_14)
            return {
              showRecordFields = function(v_15)
                return function(record_16)
                  return (function()
                    local tail = (showRecordFields1(Type_Proxy.Proxy))(record_16)
                    local key = reflectSymbol(Type_Proxy.Proxy)
                    local focus = (Record_Unsafe.unsafeGet(key))(record_16)
                    return (append(" "))((append(key))((append(": "))((append(show1(focus)))((append(","))(tail)))))
                  end)()
                end
              end
            }
          end)()
        end
      end)()
    end
  end
  local showRecordFieldsConsNil = function(dictIsSymbol_17)
    local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_17)
    return function(dictShow_18)
      return (function()
        local show1 = show(dictShow_18)
        return {
          showRecordFields = function(v_19)
            return function(record_20)
              return (function()
                local key = reflectSymbol(Type_Proxy.Proxy)
                local focus = (Record_Unsafe.unsafeGet(key))(record_20)
                return (append(" "))((append(key))((append(": "))((append(show1(focus)))(" "))))
              end)()
            end
          end
        }
      end)()
    end
  end
  return {
    show = show,
    showRecordFields = showRecordFields,
    showUnit = showUnit,
    showBoolean = showBoolean,
    showInt = showInt,
    showNumber = showNumber,
    showChar = showChar,
    showString = showString,
    showArray = showArray,
    showProxy = showProxy,
    showVoid = showVoid,
    showRecord = showRecord,
    showRecordFieldsNil = showRecordFieldsNil,
    showRecordFieldsConsNil = showRecordFieldsConsNil,
    showRecordFieldsCons = showRecordFieldsCons
  }
end)()
local Data_Ordering = (function()
  local LT = function() return { ["$ctor"] = "Data_Ordering.LT" } end
  local GT = function() return { ["$ctor"] = "Data_Ordering.GT" } end
  local EQ = function() return { ["$ctor"] = "Data_Ordering.EQ" } end
  local showOrdering = {
    show = function(v_0)
      if "Data.Ordering.LT" == v_0["$ctor"] then
        return "LT"
      else
        return (function()
          if "Data.Ordering.GT" == v_0["$ctor"] then
            return "GT"
          else
            return (function()
              if "Data.Ordering.EQ" == v_0["$ctor"] then
                return "EQ"
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)()
      end
    end
  }
  local semigroupOrdering = {
    append = function(v_1)
      return function(v1_2)
        if "Data.Ordering.LT" == v_1["$ctor"] then
          return LT
        else
          return (function()
            if "Data.Ordering.GT" == v_1["$ctor"] then
              return GT
            else
              return (function()
                if "Data.Ordering.EQ" == v_1["$ctor"] then
                  return (function() local y = v1_2 return y end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end
      end
    end
  }
  local invert = function(v_3)
    if "Data.Ordering.GT" == v_3["$ctor"] then
      return LT
    else
      return (function()
        if "Data.Ordering.EQ" == v_3["$ctor"] then
          return EQ
        else
          return (function()
            if "Data.Ordering.LT" == v_3["$ctor"] then
              return GT
            else
              return error("No patterns matched")
            end
          end)()
        end
      end)()
    end
  end
  local eqOrdering = {
    eq = function(v_4)
      return function(v1_5)
        if "Data.Ordering.LT" == v_4["$ctor"] then
          return (function()
            if "Data.Ordering.LT" == v1_5["$ctor"] then
              return true
            else
              return false
            end
          end)()
        else
          return (function()
            if "Data.Ordering.GT" == v_4["$ctor"] then
              return (function()
                if "Data.Ordering.GT" == v1_5["$ctor"] then
                  return true
                else
                  return false
                end
              end)()
            else
              return (function()
                if "Data.Ordering.EQ" == v_4["$ctor"] then
                  return (function()
                    if "Data.Ordering.EQ" == v1_5["$ctor"] then
                      return true
                    else
                      return false
                    end
                  end)()
                else
                  return false
                end
              end)()
            end
          end)()
        end
      end
    end
  }
  return {
    LT = LT,
    GT = GT,
    EQ = EQ,
    invert = invert,
    eqOrdering = eqOrdering,
    semigroupOrdering = semigroupOrdering,
    showOrdering = showOrdering
  }
end)()
local Data_Semiring = (function()
  local foreign = (function()
    return {
        intAdd = function(x) return function(y) return x + y | 0 end end,
        intMul = function(x) return function(y) return x * y | 0 end end,
        numAdd = function(x) return function(y) return x + y end end,
        numMul = function(x) return function(y) return x * y end end,
    }

  end)()
  local intAdd = foreign.intAdd
  local intMul = foreign.intMul
  local numAdd = foreign.numAdd
  local numMul = foreign.numMul
  local SemiringRecord_S_Dict = function(x_0) return x_0 end
  local Semiring_S_Dict = function(x_1) return x_1 end
  local zeroRecord = function(dict_2) local v = dict_2 return v.zeroRecord end
  local zero = function(dict_3) local v = dict_3 return v.zero end
  local semiringUnit = {
    add = function(v_4) return function(v1_5) return Data_Unit.unit end end,
    zero = Data_Unit.unit,
    mul = function(v_6) return function(v1_7) return Data_Unit.unit end end,
    one = Data_Unit.unit
  }
  local semiringRecordNil = {
    addRecord = function(v_8)
      return function(v1_9) return function(v2_10) return {} end end
    end,
    mulRecord = function(v_11)
      return function(v1_12) return function(v2_13) return {} end end
    end,
    oneRecord = function(v_14) return function(v1_15) return {} end end,
    zeroRecord = function(v_16) return function(v1_17) return {} end end
  }
  local semiringProxy = {
    add = function(v_18) return function(v1_19) return Type_Proxy.Proxy end end,
    mul = function(v_20) return function(v1_21) return Type_Proxy.Proxy end end,
    one = Type_Proxy.Proxy,
    zero = Type_Proxy.Proxy
  }
  local semiringNumber = { add = numAdd, zero = 0.0, mul = numMul, one = 1.0 }
  local semiringInt = { add = intAdd, zero = 0, mul = intMul, one = 1 }
  local oneRecord = function(dict_22) local v = dict_22 return v.oneRecord end
  local one = function(dict_23) local v = dict_23 return v.one end
  local mulRecord = function(dict_24) local v = dict_24 return v.mulRecord end
  local mul = function(dict_25) local v = dict_25 return v.mul end
  local addRecord = function(dict_26) local v = dict_26 return v.addRecord end
  local semiringRecord = function()
    return function(dictSemiringRecord_27)
      return {
        add = (addRecord(dictSemiringRecord_27))(Type_Proxy.Proxy),
        mul = (mulRecord(dictSemiringRecord_27))(Type_Proxy.Proxy),
        one = ((oneRecord(dictSemiringRecord_27))(Type_Proxy.Proxy))(Type_Proxy.Proxy),
        zero = ((zeroRecord(dictSemiringRecord_27))(Type_Proxy.Proxy))(Type_Proxy.Proxy)
      }
    end
  end
  local add = function(dict_28) local v = dict_28 return v.add end
  local semiringFn = function(dictSemiring_29)
    local add1 = add(dictSemiring_29)
    local zero1 = zero(dictSemiring_29)
    local mul1 = mul(dictSemiring_29)
    local one1 = one(dictSemiring_29)
    return {
      add = function(f_30)
        return function(g_31)
          return function(x_32) return (add1(f_30(x_32)))(g_31(x_32)) end
        end
      end,
      zero = function(v_33) return zero1 end,
      mul = function(f_34)
        return function(g_35)
          return function(x_36) return (mul1(f_34(x_36)))(g_35(x_36)) end
        end
      end,
      one = function(v_37) return one1 end
    }
  end
  local semiringRecordCons = function(dictIsSymbol_38)
    local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_38)
    return function()
      return function(dictSemiringRecord_39)
        return (function()
          local addRecord1 = addRecord(dictSemiringRecord_39)
          local mulRecord1 = mulRecord(dictSemiringRecord_39)
          local oneRecord1 = oneRecord(dictSemiringRecord_39)
          local zeroRecord1 = zeroRecord(dictSemiringRecord_39)
          return function(dictSemiring_40)
            return (function()
              local add1 = add(dictSemiring_40)
              local mul1 = mul(dictSemiring_40)
              local one1 = one(dictSemiring_40)
              local zero1 = zero(dictSemiring_40)
              return {
                addRecord = function(v_41)
                  return function(ra_42)
                    return function(rb_43)
                      return (function()
                        local tail = ((addRecord1(Type_Proxy.Proxy))(ra_42))(rb_43)
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local insert = Record_Unsafe.unsafeSet(key)
                        local get = Record_Unsafe.unsafeGet(key)
                        return (insert((add1(get(ra_42)))(get(rb_43))))(tail)
                      end)()
                    end
                  end
                end,
                mulRecord = function(v_44)
                  return function(ra_45)
                    return function(rb_46)
                      return (function()
                        local tail = ((mulRecord1(Type_Proxy.Proxy))(ra_45))(rb_46)
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local insert = Record_Unsafe.unsafeSet(key)
                        local get = Record_Unsafe.unsafeGet(key)
                        return (insert((mul1(get(ra_45)))(get(rb_46))))(tail)
                      end)()
                    end
                  end
                end,
                oneRecord = function(v_47)
                  return function(v1_48)
                    return (function()
                      local tail = (oneRecord1(Type_Proxy.Proxy))(Type_Proxy.Proxy)
                      local key = reflectSymbol(Type_Proxy.Proxy)
                      local insert = Record_Unsafe.unsafeSet(key)
                      return (insert(one1))(tail)
                    end)()
                  end
                end,
                zeroRecord = function(v_49)
                  return function(v1_50)
                    return (function()
                      local tail = (zeroRecord1(Type_Proxy.Proxy))(Type_Proxy.Proxy)
                      local key = reflectSymbol(Type_Proxy.Proxy)
                      local insert = Record_Unsafe.unsafeSet(key)
                      return (insert(zero1))(tail)
                    end)()
                  end
                end
              }
            end)()
          end
        end)()
      end
    end
  end
  return {
    add = add,
    zero = zero,
    mul = mul,
    one = one,
    addRecord = addRecord,
    mulRecord = mulRecord,
    oneRecord = oneRecord,
    zeroRecord = zeroRecord,
    semiringInt = semiringInt,
    semiringNumber = semiringNumber,
    semiringFn = semiringFn,
    semiringUnit = semiringUnit,
    semiringProxy = semiringProxy,
    semiringRecord = semiringRecord,
    semiringRecordNil = semiringRecordNil,
    semiringRecordCons = semiringRecordCons
  }
end)()
local Data_Ring = (function()
  local foreign = (function()
    return {
        intSub = function(x) return function(y) return x - y | 0 end end,
        numSub = function(x) return function(y) return x - y end end
    }

  end)()
  local intSub = foreign.intSub
  local numSub = foreign.numSub
  local semiringRecord = Data_Semiring.semiringRecord(Prim.undefined)
  local RingRecord_S_Dict = function(x_0) return x_0 end
  local Ring_S_Dict = function(x_1) return x_1 end
  local subRecord = function(dict_2) local v = dict_2 return v.subRecord end
  local sub = function(dict_3) local v = dict_3 return v.sub end
  local ringUnit = {
    sub = function(v_4) return function(v1_5) return Data_Unit.unit end end,
    Semiring0 = function() return Data_Semiring.semiringUnit end
  }
  local ringRecordNil = {
    subRecord = function(v_6)
      return function(v1_7) return function(v2_8) return {} end end
    end,
    SemiringRecord0 = function() return Data_Semiring.semiringRecordNil end
  }
  local ringRecordCons = function(dictIsSymbol_9)
    local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_9)
    local semiringRecordCons = (Data_Semiring.semiringRecordCons(dictIsSymbol_9))(Prim.undefined)
    return function()
      return function(dictRingRecord_10)
        return (function()
          local subRecord1 = subRecord(dictRingRecord_10)
          local semiringRecordCons1 = semiringRecordCons(dictRingRecord_10.SemiringRecord0(Prim.undefined))
          return function(dictRing_11)
            return (function()
              local sub1 = sub(dictRing_11)
              local semiringRecordCons2 = semiringRecordCons1(dictRing_11.Semiring0(Prim.undefined))
              return {
                subRecord = function(v_12)
                  return function(ra_13)
                    return function(rb_14)
                      return (function()
                        local tail = ((subRecord1(Type_Proxy.Proxy))(ra_13))(rb_14)
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local insert = Record_Unsafe.unsafeSet(key)
                        local get = Record_Unsafe.unsafeGet(key)
                        return (insert((sub1(get(ra_13)))(get(rb_14))))(tail)
                      end)()
                    end
                  end
                end,
                SemiringRecord0 = function() return semiringRecordCons2 end
              }
            end)()
          end
        end)()
      end
    end
  end
  local ringRecord = function()
    return function(dictRingRecord_15)
      local semiringRecord1 = semiringRecord(dictRingRecord_15.SemiringRecord0(Prim.undefined))
      return {
        sub = (subRecord(dictRingRecord_15))(Type_Proxy.Proxy),
        Semiring0 = function() return semiringRecord1 end
      }
    end
  end
  local ringProxy = {
    sub = function(v_16) return function(v1_17) return Type_Proxy.Proxy end end,
    Semiring0 = function() return Data_Semiring.semiringProxy end
  }
  local ringNumber = {
    sub = numSub,
    Semiring0 = function() return Data_Semiring.semiringNumber end
  }
  local ringInt = {
    sub = intSub,
    Semiring0 = function() return Data_Semiring.semiringInt end
  }
  local ringFn = function(dictRing_18)
    local sub1 = sub(dictRing_18)
    local semiringFn = Data_Semiring.semiringFn(dictRing_18.Semiring0(Prim.undefined))
    return {
      sub = function(f_19)
        return function(g_20)
          return function(x_21) return (sub1(f_19(x_21)))(g_20(x_21)) end
        end
      end,
      Semiring0 = function() return semiringFn end
    }
  end
  local negate = function(dictRing_22)
    local sub1 = sub(dictRing_22)
    local zero = Data_Semiring.zero(dictRing_22.Semiring0(Prim.undefined))
    return function(a_23) return (sub1(zero))(a_23) end
  end
  return {
    sub = sub,
    negate = negate,
    subRecord = subRecord,
    ringInt = ringInt,
    ringNumber = ringNumber,
    ringUnit = ringUnit,
    ringFn = ringFn,
    ringProxy = ringProxy,
    ringRecord = ringRecord,
    ringRecordNil = ringRecordNil,
    ringRecordCons = ringRecordCons
  }
end)()
local Data_Ord = (function()
  local foreign = (function()
    local unsafeCoerceImpl = function(lt)
        return function(eq)
            return function(gt)
                return function(x)
                    return function(y)
                        if x < y then
                            return lt
                        elseif x == y then
                            return eq
                        else
                            return gt
                        end
                    end
                end
            end
        end
    end

    return {
        ordBooleanImpl = unsafeCoerceImpl,
        ordIntImpl = unsafeCoerceImpl,
        ordNumberImpl = unsafeCoerceImpl,
        ordStringImpl = unsafeCoerceImpl,
        ordCharImpl = unsafeCoerceImpl,
        ordArrayImpl = function(f)
            return function(xs)
                return function(ys)
                    local i = 1
                    local xlen = #xs
                    local ylen = #ys
                    while i <= xlen and i <= ylen do
                        local x = xs[i]
                        local y = ys[i]
                        local o = f(x)(y)
                        if o ~= 0 then
                            return o
                        end
                        i = i + 1
                    end
                    if xlen == ylen then
                        return 0
                    elseif xlen > ylen then
                        return -1
                    else
                        return 1
                    end
                end
            end
        end
    }

  end)()
  local ordBooleanImpl = foreign.ordBooleanImpl
  local ordIntImpl = foreign.ordIntImpl
  local ordNumberImpl = foreign.ordNumberImpl
  local ordStringImpl = foreign.ordStringImpl
  local ordCharImpl = foreign.ordCharImpl
  local ordArrayImpl = foreign.ordArrayImpl
  local eqRec = Data_Eq.eqRec(Prim.undefined)
  local negate = Data_Ring.negate(Data_Ring.ringInt)
  local notEq = Data_Eq.notEq(Data_Ordering.eqOrdering)
  local OrdRecord_S_Dict = function(x_0) return x_0 end
  local Ord_S_Dict = function(x_1) return x_1 end
  local Ord1_S_Dict = function(x_2) return x_2 end
  local ordVoid = {
    compare = function(v_3)
      return function(v1_4) return Data_Ordering.EQ end
    end,
    Eq0 = function() return Data_Eq.eqVoid end
  }
  local ordUnit = {
    compare = function(v_5)
      return function(v1_6) return Data_Ordering.EQ end
    end,
    Eq0 = function() return Data_Eq.eqUnit end
  }
  local ordString = {
    compare = ((ordStringImpl(Data_Ordering.LT))(Data_Ordering.EQ))(Data_Ordering.GT),
    Eq0 = function() return Data_Eq.eqString end
  }
  local ordRecordNil = {
    compareRecord = function(v_7)
      return function(v1_8)
        return function(v2_9) return Data_Ordering.EQ end
      end
    end,
    EqRecord0 = function() return Data_Eq.eqRowNil end
  }
  local ordProxy = {
    compare = function(v_10)
      return function(v1_11) return Data_Ordering.EQ end
    end,
    Eq0 = function() return Data_Eq.eqProxy end
  }
  local ordOrdering = {
    compare = function(v_12)
      return function(v1_13)
        if "Data.Ordering.LT" == v_12["$ctor"] then
          return (function()
            if "Data.Ordering.LT" == v1_13["$ctor"] then
              return Data_Ordering.EQ
            else
              return Data_Ordering.LT
            end
          end)()
        else
          return (function()
            if "Data.Ordering.EQ" == v_12["$ctor"] then
              return (function()
                if "Data.Ordering.EQ" == v1_13["$ctor"] then
                  return Data_Ordering.EQ
                else
                  return (function()
                    if "Data.Ordering.LT" == v1_13["$ctor"] then
                      return Data_Ordering.GT
                    else
                      return (function()
                        if "Data.Ordering.GT" == v1_13["$ctor"] then
                          return Data_Ordering.LT
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    end
                  end)()
                end
              end)()
            else
              return (function()
                if "Data.Ordering.GT" == v_12["$ctor"] then
                  return (function()
                    if "Data.Ordering.GT" == v1_13["$ctor"] then
                      return Data_Ordering.EQ
                    else
                      return Data_Ordering.GT
                    end
                  end)()
                else
                  return (function()
                    if "Data.Ordering.LT" == v_12["$ctor"] then
                      return Data_Ordering.LT
                    else
                      return (function()
                        if "Data.Ordering.EQ" == v_12["$ctor"] then
                          return (function()
                            if "Data.Ordering.LT" == v1_13["$ctor"] then
                              return Data_Ordering.GT
                            else
                              return (function()
                                if "Data.Ordering.GT" == v1_13["$ctor"] then
                                  return Data_Ordering.LT
                                else
                                  return error("No patterns matched")
                                end
                              end)()
                            end
                          end)()
                        else
                          return (function()
                            if "Data.Ordering.GT" == v_12["$ctor"] then
                              return Data_Ordering.GT
                            else
                              return error("No patterns matched")
                            end
                          end)()
                        end
                      end)()
                    end
                  end)()
                end
              end)()
            end
          end)()
        end
      end
    end,
    Eq0 = function() return Data_Ordering.eqOrdering end
  }
  local ordNumber = {
    compare = ((ordNumberImpl(Data_Ordering.LT))(Data_Ordering.EQ))(Data_Ordering.GT),
    Eq0 = function() return Data_Eq.eqNumber end
  }
  local ordInt = {
    compare = ((ordIntImpl(Data_Ordering.LT))(Data_Ordering.EQ))(Data_Ordering.GT),
    Eq0 = function() return Data_Eq.eqInt end
  }
  local ordChar = {
    compare = ((ordCharImpl(Data_Ordering.LT))(Data_Ordering.EQ))(Data_Ordering.GT),
    Eq0 = function() return Data_Eq.eqChar end
  }
  local ordBoolean = {
    compare = ((ordBooleanImpl(Data_Ordering.LT))(Data_Ordering.EQ))(Data_Ordering.GT),
    Eq0 = function() return Data_Eq.eqBoolean end
  }
  local compareRecord = function(dict_14)
    local v = dict_14
    return v.compareRecord
  end
  local ordRecord = function()
    return function(dictOrdRecord_15)
      local eqRec1 = eqRec(dictOrdRecord_15.EqRecord0(Prim.undefined))
      return {
        compare = (compareRecord(dictOrdRecord_15))(Type_Proxy.Proxy),
        Eq0 = function() return eqRec1 end
      }
    end
  end
  local compare1 = function(dict_16) local v = dict_16 return v.compare1 end
  local compare = function(dict_17) local v = dict_17 return v.compare end
  local compare2 = compare(ordInt)
  local comparing = function(dictOrd_18)
    local compare3 = compare(dictOrd_18)
    return function(f_19)
      return function(x_20)
        return function(y_21) return (compare3(f_19(x_20)))(f_19(y_21)) end
      end
    end
  end
  local greaterThan = function(dictOrd_22)
    local compare3 = compare(dictOrd_22)
    return function(a1_23)
      return function(a2_24)
        return (function()
          local v = (compare3(a1_23))(a2_24)
          return (function()
            if "Data.Ordering.GT" == v["$ctor"] then
              return true
            else
              return false
            end
          end)()
        end)()
      end
    end
  end
  local greaterThanOrEq = function(dictOrd_25)
    local compare3 = compare(dictOrd_25)
    return function(a1_26)
      return function(a2_27)
        return (function()
          local v = (compare3(a1_26))(a2_27)
          return (function()
            if "Data.Ordering.LT" == v["$ctor"] then
              return false
            else
              return true
            end
          end)()
        end)()
      end
    end
  end
  local lessThan = function(dictOrd_28)
    local compare3 = compare(dictOrd_28)
    return function(a1_29)
      return function(a2_30)
        return (function()
          local v = (compare3(a1_29))(a2_30)
          return (function()
            if "Data.Ordering.LT" == v["$ctor"] then
              return true
            else
              return false
            end
          end)()
        end)()
      end
    end
  end
  local signum = function(dictOrd_31)
    local lessThan1 = lessThan(dictOrd_31)
    local greaterThan1 = greaterThan(dictOrd_31)
    return function(dictRing_32)
      return (function()
        local Semiring0 = dictRing_32.Semiring0(Prim.undefined)
        local zero = Data_Semiring.zero(Semiring0)
        local negate1 = Data_Ring.negate(dictRing_32)
        local one = Data_Semiring.one(Semiring0)
        return function(x_33)
          return (function()
            local e3 = (lessThan1(x_33))(zero)
            return (function()
              if true == e3 then
                return negate1(one)
              else
                return (function()
                  local e4 = (greaterThan1(x_33))(zero)
                  return (function()
                    if true == e4 then return one else return x_33 end
                  end)()
                end)()
              end
            end)()
          end)()
        end
      end)()
    end
  end
  local lessThanOrEq = function(dictOrd_34)
    local compare3 = compare(dictOrd_34)
    return function(a1_35)
      return function(a2_36)
        return (function()
          local v = (compare3(a1_35))(a2_36)
          return (function()
            if "Data.Ordering.GT" == v["$ctor"] then
              return false
            else
              return true
            end
          end)()
        end)()
      end
    end
  end
  local max = function(dictOrd_37)
    local compare3 = compare(dictOrd_37)
    return function(x_38)
      return function(y_39)
        return (function()
          local v = (compare3(x_38))(y_39)
          return (function()
            if "Data.Ordering.LT" == v["$ctor"] then
              return y_39
            else
              return (function()
                if "Data.Ordering.EQ" == v["$ctor"] then
                  return x_38
                else
                  return (function()
                    if "Data.Ordering.GT" == v["$ctor"] then
                      return x_38
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end)()
            end
          end)()
        end)()
      end
    end
  end
  local min = function(dictOrd_40)
    local compare3 = compare(dictOrd_40)
    return function(x_41)
      return function(y_42)
        return (function()
          local v = (compare3(x_41))(y_42)
          return (function()
            if "Data.Ordering.LT" == v["$ctor"] then
              return x_41
            else
              return (function()
                if "Data.Ordering.EQ" == v["$ctor"] then
                  return x_41
                else
                  return (function()
                    if "Data.Ordering.GT" == v["$ctor"] then
                      return y_42
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end)()
            end
          end)()
        end)()
      end
    end
  end
  local ordArray = function(dictOrd_43)
    local compare3 = compare(dictOrd_43)
    local eqArray = Data_Eq.eqArray(dictOrd_43.Eq0(Prim.undefined))
    return {
      compare = (function()
        local toDelta = function(x_46)
          return function(y_47)
            return (function()
              local v = (compare3(x_46))(y_47)
              return (function()
                if "Data.Ordering.EQ" == v["$ctor"] then
                  return 0
                else
                  return (function()
                    if "Data.Ordering.LT" == v["$ctor"] then
                      return 1
                    else
                      return (function()
                        if "Data.Ordering.GT" == v["$ctor"] then
                          return negate(1)
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    end
                  end)()
                end
              end)()
            end)()
          end
        end
        return function(xs_44)
          return function(ys_45)
            return (compare2(0))(((ordArrayImpl(toDelta))(xs_44))(ys_45))
          end
        end
      end)(),
      Eq0 = function() return eqArray end
    }
  end
  local ord1Array = {
    compare1 = function(dictOrd_48) return compare(ordArray(dictOrd_48)) end,
    Eq10 = function() return Data_Eq.eq1Array end
  }
  local ordRecordCons = function(dictOrdRecord_49)
    local compareRecord1 = compareRecord(dictOrdRecord_49)
    local eqRowCons = (Data_Eq.eqRowCons(dictOrdRecord_49.EqRecord0(Prim.undefined)))(Prim.undefined)
    return function()
      return function(dictIsSymbol_50)
        return (function()
          local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_50)
          local eqRowCons1 = eqRowCons(dictIsSymbol_50)
          return function(dictOrd_51)
            return (function()
              local compare3 = compare(dictOrd_51)
              local eqRowCons2 = eqRowCons1(dictOrd_51.Eq0(Prim.undefined))
              return {
                compareRecord = function(v_52)
                  return function(ra_53)
                    return function(rb_54)
                      return (function()
                        local unsafeGetPrime = Record_Unsafe.unsafeGet
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local left = (compare3((unsafeGetPrime(key))(ra_53)))((unsafeGetPrime(key))(rb_54))
                        return (function()
                          local e5 = (notEq(left))(Data_Ordering.EQ)
                          return (function()
                            if true == e5 then
                              return left
                            else
                              return ((compareRecord1(Type_Proxy.Proxy))(ra_53))(rb_54)
                            end
                          end)()
                        end)()
                      end)()
                    end
                  end
                end,
                EqRecord0 = function() return eqRowCons2 end
              }
            end)()
          end
        end)()
      end
    end
  end
  local clamp = function(dictOrd_55)
    local min1 = min(dictOrd_55)
    local max1 = max(dictOrd_55)
    return function(low_56)
      return function(hi_57)
        return function(x_58) return (min1(hi_57))((max1(low_56))(x_58)) end
      end
    end
  end
  local between = function(dictOrd_59)
    local lessThan1 = lessThan(dictOrd_59)
    local greaterThan1 = greaterThan(dictOrd_59)
    return function(low_60)
      return function(hi_61)
        return function(x_62)
          return (function()
            local n6 = error("No patterns matched")
            local x1 = x_62
            local hi1 = hi_61
            local low1 = low_60
            return (function()
              if (lessThan1(x1))(low1) then
                return false
              else
                return (function()
                  if (greaterThan1(x1))(hi1) then
                    return false
                  else
                    return true
                  end
                end)()
              end
            end)()
          end)()
        end
      end
    end
  end
  local abs = function(dictOrd_63)
    local greaterThanOrEq1 = greaterThanOrEq(dictOrd_63)
    return function(dictRing_64)
      return (function()
        local zero = Data_Semiring.zero(dictRing_64.Semiring0(Prim.undefined))
        local negate1 = Data_Ring.negate(dictRing_64)
        return function(x_65)
          return (function()
            local e7 = (greaterThanOrEq1(x_65))(zero)
            return (function()
              if true == e7 then return x_65 else return negate1(x_65) end
            end)()
          end)()
        end
      end)()
    end
  end
  return {
    compare = compare,
    compare1 = compare1,
    lessThan = lessThan,
    lessThanOrEq = lessThanOrEq,
    greaterThan = greaterThan,
    greaterThanOrEq = greaterThanOrEq,
    comparing = comparing,
    min = min,
    max = max,
    clamp = clamp,
    between = between,
    abs = abs,
    signum = signum,
    compareRecord = compareRecord,
    ordBoolean = ordBoolean,
    ordInt = ordInt,
    ordNumber = ordNumber,
    ordString = ordString,
    ordChar = ordChar,
    ordUnit = ordUnit,
    ordVoid = ordVoid,
    ordProxy = ordProxy,
    ordArray = ordArray,
    ordOrdering = ordOrdering,
    ord1Array = ord1Array,
    ordRecordNil = ordRecordNil,
    ordRecordCons = ordRecordCons,
    ordRecord = ordRecord
  }
end)()
local Data_Function = (function()
  local lessThanOrEq = Data_Ord.lessThanOrEq(Data_Ord.ordInt)
  local sub = Data_Ring.sub(Data_Ring.ringInt)
  local on = function(f_0)
    return function(g_1)
      return function(x_2)
        return function(y_3) return (f_0(g_1(x_2)))(g_1(y_3)) end
      end
    end
  end
  local flip = function(f_4)
    return function(b_5) return function(a_6) return (f_4(a_6))(b_5) end end
  end
  local const = function(a_7) return function(v_8) return a_7 end end
  local applyN = function(f_9)
    local go
    go = function(n_10)
      return function(acc_11)
        return (function()
          local n0 = error("No patterns matched")
          local acc1 = acc_11
          local n1 = n_10
          return (function()
            if (lessThanOrEq(n1))(0) then
              return acc1
            else
              return (function()
                if Data_Boolean.otherwise then
                  return (go((sub(n1))(1)))(f_9(acc1))
                else
                  return n0
                end
              end)()
            end
          end)()
        end)()
      end
    end
    return go
  end
  local applyFlipped = function(x_12)
    return function(f_13) return f_13(x_12) end
  end
  local apply = function(f_14) return function(x_15) return f_14(x_15) end end
  return {
    flip = flip,
    const = const,
    apply = apply,
    applyFlipped = applyFlipped,
    applyN = applyN,
    on = on
  }
end)()
local Data_Functor = (function()
  local foreign = (function()
    return {
        arrayMap = function(f) return function(arr)
                local l = #arr
                local result = {}
                for i = 1, l do result[i] = f(arr[i]) end
                return result
            end
        end
    }

  end)()
  local arrayMap = foreign.arrayMap
  local Functor_S_Dict = function(x_0) return x_0 end
  local map = function(dict_1) local v = dict_1 return v.map end
  local mapFlipped = function(dictFunctor_2)
    local map1 = map(dictFunctor_2)
    return function(fa_3) return function(f_4) return (map1(f_4))(fa_3) end end
  end
  local void = function(dictFunctor_5)
    return (map(dictFunctor_5))(Data_Function.const(Data_Unit.unit))
  end
  local voidLeft = function(dictFunctor_6)
    local map1 = map(dictFunctor_6)
    return function(f_7)
      return function(x_8) return (map1(Data_Function.const(x_8)))(f_7) end
    end
  end
  local voidRight = function(dictFunctor_9)
    local map1 = map(dictFunctor_9)
    return function(x_10) return map1(Data_Function.const(x_10)) end
  end
  local functorProxy = {
    map = function(v_11) return function(v1_12) return Type_Proxy.Proxy end end
  }
  local functorFn = {
    map = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  }
  local functorArray = { map = arrayMap }
  local flap = function(dictFunctor_13)
    local map1 = map(dictFunctor_13)
    return function(ff_14)
      return function(x_15)
        return (map1(function(f_16) return f_16(x_15) end))(ff_14)
      end
    end
  end
  return {
    map = map,
    mapFlipped = mapFlipped,
    void = void,
    voidRight = voidRight,
    voidLeft = voidLeft,
    flap = flap,
    functorFn = functorFn,
    functorArray = functorArray,
    functorProxy = functorProxy
  }
end)()
local Control_Alt = (function()
  local Alt_S_Dict = function(x_0) return x_0 end
  local altArray = {
    alt = Data_Semigroup.append(Data_Semigroup.semigroupArray),
    Functor0 = function() return Data_Functor.functorArray end
  }
  local alt = function(dict_1) local v = dict_1 return v.alt end
  return { alt = alt, altArray = altArray }
end)()
local Control_Apply = (function()
  local foreign = (function()
    return {
        arrayApply = function(fs)
            return function(xs)
                local n, l, m, result = 1, #fs, #xs, {}
                for i = 1, l do
                    for j = 1, m do
                        result[n] = fs[i](xs[j])
                        n = n + 1
                    end
                end
                return result
            end
        end
    }

  end)()
  local arrayApply = foreign.arrayApply
  local identity = Control_Category.identity(Control_Category.categoryFn)
  local Apply_S_Dict = function(x_0) return x_0 end
  local applyProxy = {
    apply = function(v_1) return function(v1_2) return Type_Proxy.Proxy end end,
    Functor0 = function() return Data_Functor.functorProxy end
  }
  local applyFn = {
    apply = function(f_3)
      return function(g_4)
        return function(x_5) return (f_3(x_5))(g_4(x_5)) end
      end
    end,
    Functor0 = function() return Data_Functor.functorFn end
  }
  local applyArray = {
    apply = arrayApply,
    Functor0 = function() return Data_Functor.functorArray end
  }
  local apply = function(dict_6) local v = dict_6 return v.apply end
  local applyFirst = function(dictApply_7)
    local apply1 = apply(dictApply_7)
    local map = Data_Functor.map(dictApply_7.Functor0(Prim.undefined))
    return function(a_8)
      return function(b_9)
        return (apply1((map(Data_Function.const))(a_8)))(b_9)
      end
    end
  end
  local applySecond = function(dictApply_10)
    local apply1 = apply(dictApply_10)
    local map = Data_Functor.map(dictApply_10.Functor0(Prim.undefined))
    return function(a_11)
      return function(b_12)
        return (apply1((map(Data_Function.const(identity)))(a_11)))(b_12)
      end
    end
  end
  local lift2 = function(dictApply_13)
    local apply1 = apply(dictApply_13)
    local map = Data_Functor.map(dictApply_13.Functor0(Prim.undefined))
    return function(f_14)
      return function(a_15)
        return function(b_16) return (apply1((map(f_14))(a_15)))(b_16) end
      end
    end
  end
  local lift3 = function(dictApply_17)
    local apply1 = apply(dictApply_17)
    local map = Data_Functor.map(dictApply_17.Functor0(Prim.undefined))
    return function(f_18)
      return function(a_19)
        return function(b_20)
          return function(c_21)
            return (apply1((apply1((map(f_18))(a_19)))(b_20)))(c_21)
          end
        end
      end
    end
  end
  local lift4 = function(dictApply_22)
    local apply1 = apply(dictApply_22)
    local map = Data_Functor.map(dictApply_22.Functor0(Prim.undefined))
    return function(f_23)
      return function(a_24)
        return function(b_25)
          return function(c_26)
            return function(d_27)
              return (apply1((apply1((apply1((map(f_23))(a_24)))(b_25)))(c_26)))(d_27)
            end
          end
        end
      end
    end
  end
  local lift5 = function(dictApply_28)
    local apply1 = apply(dictApply_28)
    local map = Data_Functor.map(dictApply_28.Functor0(Prim.undefined))
    return function(f_29)
      return function(a_30)
        return function(b_31)
          return function(c_32)
            return function(d_33)
              return function(e_34)
                return (apply1((apply1((apply1((apply1((map(f_29))(a_30)))(b_31)))(c_32)))(d_33)))(e_34)
              end
            end
          end
        end
      end
    end
  end
  return {
    apply = apply,
    applyFirst = applyFirst,
    applySecond = applySecond,
    lift2 = lift2,
    lift3 = lift3,
    lift4 = lift4,
    lift5 = lift5,
    applyFn = applyFn,
    applyArray = applyArray,
    applyProxy = applyProxy
  }
end)()
local Control_Applicative = (function()
  local Applicative_S_Dict = function(x_0) return x_0 end
  local pure = function(dict_1) local v = dict_1 return v.pure end
  local unless = function(dictApplicative_2)
    local pure1 = pure(dictApplicative_2)
    return function(v_3)
      return function(v1_4)
        return (function()
          if false == v_3 then
            return (function() local m = v1_4 return m end)()
          else
            return (function()
              if true == v_3 then
                return pure1(Data_Unit.unit)
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)()
      end
    end
  end
  local when = function(dictApplicative_5)
    local pure1 = pure(dictApplicative_5)
    return function(v_6)
      return function(v1_7)
        return (function()
          if true == v_6 then
            return (function() local m = v1_7 return m end)()
          else
            return (function()
              if false == v_6 then
                return pure1(Data_Unit.unit)
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)()
      end
    end
  end
  local liftA1 = function(dictApplicative_8)
    local apply = Control_Apply.apply(dictApplicative_8.Apply0(Prim.undefined))
    local pure1 = pure(dictApplicative_8)
    return function(f_9)
      return function(a_10) return (apply(pure1(f_9)))(a_10) end
    end
  end
  local applicativeProxy = {
    pure = function(v_11) return Type_Proxy.Proxy end,
    Apply0 = function() return Control_Apply.applyProxy end
  }
  local applicativeFn = {
    pure = function(x_12) return function(v_13) return x_12 end end,
    Apply0 = function() return Control_Apply.applyFn end
  }
  local applicativeArray = {
    pure = function(x_14) return { x_14 } end,
    Apply0 = function() return Control_Apply.applyArray end
  }
  return {
    pure = pure,
    liftA1 = liftA1,
    unless = unless,
    when = when,
    applicativeFn = applicativeFn,
    applicativeArray = applicativeArray,
    applicativeProxy = applicativeProxy
  }
end)()
local Control_Plus = (function()
  local Plus_S_Dict = function(x_0) return x_0 end
  local plusArray = {
    empty = {},
    Alt0 = function() return Control_Alt.altArray end
  }
  local empty = function(dict_1) local v = dict_1 return v.empty end
  return { empty = empty, plusArray = plusArray }
end)()
local Control_Alternative = (function()
  local Alternative_S_Dict = function(x_0) return x_0 end
  local guard = function(dictAlternative_1)
    local pure = Control_Applicative.pure(dictAlternative_1.Applicative0(Prim.undefined))
    local empty = Control_Plus.empty(dictAlternative_1.Plus1(Prim.undefined))
    return function(v_2)
      return (function()
        if true == v_2 then
          return pure(Data_Unit.unit)
        else
          return (function()
            if false == v_2 then
              return empty
            else
              return error("No patterns matched")
            end
          end)()
        end
      end)()
    end
  end
  local alternativeArray = {
    Applicative0 = function() return Control_Applicative.applicativeArray end,
    Plus1 = function() return Control_Plus.plusArray end
  }
  return { guard = guard, alternativeArray = alternativeArray }
end)()
local Control_Bind = (function()
  local foreign = (function()
    return {
        arrayBind = function(arr)
            return function(f)
                local n = 1
                local result = {}
                for i = 1, #arr do
                    for _, v in ipairs(f(arr[i])) do
                        result[n] = v
                        n = n + 1
                    end
                end
                return result
            end
        end
    }

  end)()
  local arrayBind = foreign.arrayBind
  local identity = Control_Category.identity(Control_Category.categoryFn)
  local Bind_S_Dict = function(x_0) return x_0 end
  local Discard_S_Dict = function(x_1) return x_1 end
  local discard = function(dict_2) local v = dict_2 return v.discard end
  local bindProxy = {
    bind = function(v_3) return function(v1_4) return Type_Proxy.Proxy end end,
    Apply0 = function() return Control_Apply.applyProxy end
  }
  local bindFn = {
    bind = function(m_5)
      return function(f_6)
        return function(x_7) return (f_6(m_5(x_7)))(x_7) end
      end
    end,
    Apply0 = function() return Control_Apply.applyFn end
  }
  local bindArray = {
    bind = arrayBind,
    Apply0 = function() return Control_Apply.applyArray end
  }
  local bind = function(dict_8) local v = dict_8 return v.bind end
  local bindFlipped = function(dictBind_9)
    return Data_Function.flip(bind(dictBind_9))
  end
  local composeKleisliFlipped = function(dictBind_10)
    local bindFlipped1 = bindFlipped(dictBind_10)
    return function(f_11)
      return function(g_12)
        return function(a_13) return (bindFlipped1(f_11))(g_12(a_13)) end
      end
    end
  end
  local composeKleisli = function(dictBind_14)
    local bind1 = bind(dictBind_14)
    return function(f_15)
      return function(g_16)
        return function(a_17) return (bind1(f_15(a_17)))(g_16) end
      end
    end
  end
  local discardProxy = {
    discard = function(dictBind_18) return bind(dictBind_18) end
  }
  local discardUnit = {
    discard = function(dictBind_19) return bind(dictBind_19) end
  }
  local ifM = function(dictBind_20)
    local bind1 = bind(dictBind_20)
    return function(cond_21)
      return function(t_22)
        return function(f_23)
          return (bind1(cond_21))(function(condPrime_24)
            return (function()
              if true == condPrime_24 then return t_22 else return f_23 end
            end)()
          end)
        end
      end
    end
  end
  local join = function(dictBind_25)
    local bind1 = bind(dictBind_25)
    return function(m_26) return (bind1(m_26))(identity) end
  end
  return {
    bind = bind,
    bindFlipped = bindFlipped,
    discard = discard,
    join = join,
    composeKleisli = composeKleisli,
    composeKleisliFlipped = composeKleisliFlipped,
    ifM = ifM,
    bindFn = bindFn,
    bindArray = bindArray,
    bindProxy = bindProxy,
    discardUnit = discardUnit,
    discardProxy = discardProxy
  }
end)()
local Control_Extend = (function()
  local foreign = (function()
    return {
        arrayExtend = function(f) return function(xs)
                local result = {}
                for i, _ in ipairs(xs) do
                    result[i] = f(table.unpack(xs, i + 1))
                end
                return result
            end;
        end;
    }

  end)()
  local arrayExtend = foreign.arrayExtend
  local identity = Control_Category.identity(Control_Category.categoryFn)
  local Extend_S_Dict = function(x_0) return x_0 end
  local extendFn = function(dictSemigroup_1)
    local append = Data_Semigroup.append(dictSemigroup_1)
    return {
      extend = function(f_2)
        return function(g_3)
          return function(w_4)
            return f_2(function(wPrime_5)
              return g_3((append(w_4))(wPrime_5))
            end)
          end
        end
      end,
      Functor0 = function() return Data_Functor.functorFn end
    }
  end
  local extendArray = {
    extend = arrayExtend,
    Functor0 = function() return Data_Functor.functorArray end
  }
  local extend = function(dict_6) local v = dict_6 return v.extend end
  local extendFlipped = function(dictExtend_7)
    local extend1 = extend(dictExtend_7)
    return function(w_8) return function(f_9) return (extend1(f_9))(w_8) end end
  end
  local duplicate = function(dictExtend_10)
    return (extend(dictExtend_10))(identity)
  end
  local composeCoKleisliFlipped = function(dictExtend_11)
    local extend1 = extend(dictExtend_11)
    return function(f_12)
      return function(g_13)
        return function(w_14) return f_12((extend1(g_13))(w_14)) end
      end
    end
  end
  local composeCoKleisli = function(dictExtend_15)
    local extend1 = extend(dictExtend_15)
    return function(f_16)
      return function(g_17)
        return function(w_18) return g_17((extend1(f_16))(w_18)) end
      end
    end
  end
  return {
    extend = extend,
    extendFlipped = extendFlipped,
    composeCoKleisli = composeCoKleisli,
    composeCoKleisliFlipped = composeCoKleisliFlipped,
    duplicate = duplicate,
    extendFn = extendFn,
    extendArray = extendArray
  }
end)()
local Control_Comonad = (function()
  local Comonad_S_Dict = function(x_0) return x_0 end
  local extract = function(dict_1) local v = dict_1 return v.extract end
  return { extract = extract }
end)()
local Control_Lazy = (function()
  local Lazy_S_Dict = function(x_0) return x_0 end
  local lazyUnit = { defer = function(v_1) return Data_Unit.unit end }
  local lazyFn = {
    defer = function(f_2)
      return function(x_3) return (f_2(Data_Unit.unit))(x_3) end
    end
  }
  local defer = function(dict_4) local v = dict_4 return v.defer end
  local fix = function(dictLazy_5)
    local defer1 = defer(dictLazy_5)
    return function(f_6)
      return (function()
        local _S___lazy_go
        local go
        _S___lazy_go = (_S___runtime_lazy("go"))(function()
          return defer1(function(v_7) return f_6(_S___lazy_go(0)) end)
        end)
        go = _S___lazy_go(0)
        return go
      end)()
    end
  end
  return { defer = defer, fix = fix, lazyFn = lazyFn, lazyUnit = lazyUnit }
end)()
local Control_Monad = (function()
  local Monad_S_Dict = function(x_0) return x_0 end
  local whenM = function(dictMonad_1)
    local bind = Control_Bind.bind(dictMonad_1.Bind1(Prim.undefined))
    local when = Control_Applicative.when(dictMonad_1.Applicative0(Prim.undefined))
    return function(mb_2)
      return function(m_3)
        return (bind(mb_2))(function(b_4) return (when(b_4))(m_3) end)
      end
    end
  end
  local unlessM = function(dictMonad_5)
    local bind = Control_Bind.bind(dictMonad_5.Bind1(Prim.undefined))
    local unless = Control_Applicative.unless(dictMonad_5.Applicative0(Prim.undefined))
    return function(mb_6)
      return function(m_7)
        return (bind(mb_6))(function(b_8) return (unless(b_8))(m_7) end)
      end
    end
  end
  local monadProxy = {
    Applicative0 = function() return Control_Applicative.applicativeProxy end,
    Bind1 = function() return Control_Bind.bindProxy end
  }
  local monadFn = {
    Applicative0 = function() return Control_Applicative.applicativeFn end,
    Bind1 = function() return Control_Bind.bindFn end
  }
  local monadArray = {
    Applicative0 = function() return Control_Applicative.applicativeArray end,
    Bind1 = function() return Control_Bind.bindArray end
  }
  local liftM1 = function(dictMonad_9)
    local bind = Control_Bind.bind(dictMonad_9.Bind1(Prim.undefined))
    local pure = Control_Applicative.pure(dictMonad_9.Applicative0(Prim.undefined))
    return function(f_10)
      return function(a_11)
        return (bind(a_11))(function(aPrime_12)
          return pure(f_10(aPrime_12))
        end)
      end
    end
  end
  local ap = function(dictMonad_13)
    local bind = Control_Bind.bind(dictMonad_13.Bind1(Prim.undefined))
    local pure = Control_Applicative.pure(dictMonad_13.Applicative0(Prim.undefined))
    return function(f_14)
      return function(a_15)
        return (bind(f_14))(function(fPrime_16)
          return (bind(a_15))(function(aPrime_17)
            return pure(fPrime_16(aPrime_17))
          end)
        end)
      end
    end
  end
  return {
    liftM1 = liftM1,
    whenM = whenM,
    unlessM = unlessM,
    ap = ap,
    monadFn = monadFn,
    monadArray = monadArray,
    monadProxy = monadProxy
  }
end)()
local Control_MonadPlus = (function()
  local MonadPlus_S_Dict = function(x_0) return x_0 end
  local monadPlusArray = {
    Monad0 = function() return Control_Monad.monadArray end,
    Alternative1 = function() return Control_Alternative.alternativeArray end
  }
  return { monadPlusArray = monadPlusArray }
end)()
local Data_BooleanAlgebra = (function()
  local heytingAlgebraRecord = Data_HeytingAlgebra.heytingAlgebraRecord(Prim.undefined)
  local BooleanAlgebraRecord_S_Dict = function(x_0) return x_0 end
  local BooleanAlgebra_S_Dict = function(x_1) return x_1 end
  local booleanAlgebraUnit = {
    HeytingAlgebra0 = function()
      return Data_HeytingAlgebra.heytingAlgebraUnit
    end
  }
  local booleanAlgebraRecordNil = {
    HeytingAlgebraRecord0 = function()
      return Data_HeytingAlgebra.heytingAlgebraRecordNil
    end
  }
  local booleanAlgebraRecordCons = function(dictIsSymbol_2)
    local heytingAlgebraRecordCons = (Data_HeytingAlgebra.heytingAlgebraRecordCons(dictIsSymbol_2))(Prim.undefined)
    return function()
      return function(dictBooleanAlgebraRecord_3)
        return (function()
          local heytingAlgebraRecordCons1 = heytingAlgebraRecordCons(dictBooleanAlgebraRecord_3.HeytingAlgebraRecord0(Prim.undefined))
          return function(dictBooleanAlgebra_4)
            return (function()
              local heytingAlgebraRecordCons2 = heytingAlgebraRecordCons1(dictBooleanAlgebra_4.HeytingAlgebra0(Prim.undefined))
              return {
                HeytingAlgebraRecord0 = function()
                  return heytingAlgebraRecordCons2
                end
              }
            end)()
          end
        end)()
      end
    end
  end
  local booleanAlgebraRecord = function()
    return function(dictBooleanAlgebraRecord_5)
      local heytingAlgebraRecord1 = heytingAlgebraRecord(dictBooleanAlgebraRecord_5.HeytingAlgebraRecord0(Prim.undefined))
      return { HeytingAlgebra0 = function() return heytingAlgebraRecord1 end }
    end
  end
  local booleanAlgebraProxy = {
    HeytingAlgebra0 = function()
      return Data_HeytingAlgebra.heytingAlgebraProxy
    end
  }
  local booleanAlgebraFn = function(dictBooleanAlgebra_6)
    local heytingAlgebraFunction = Data_HeytingAlgebra.heytingAlgebraFunction(dictBooleanAlgebra_6.HeytingAlgebra0(Prim.undefined))
    return { HeytingAlgebra0 = function() return heytingAlgebraFunction end }
  end
  local booleanAlgebraBoolean = {
    HeytingAlgebra0 = function()
      return Data_HeytingAlgebra.heytingAlgebraBoolean
    end
  }
  return {
    booleanAlgebraBoolean = booleanAlgebraBoolean,
    booleanAlgebraUnit = booleanAlgebraUnit,
    booleanAlgebraFn = booleanAlgebraFn,
    booleanAlgebraRecord = booleanAlgebraRecord,
    booleanAlgebraProxy = booleanAlgebraProxy,
    booleanAlgebraRecordNil = booleanAlgebraRecordNil,
    booleanAlgebraRecordCons = booleanAlgebraRecordCons
  }
end)()
local Data_Bounded = (function()
  local foreign = (function()
    return {
        topInt = math.maxinteger,
        bottomInt = math.mininteger,
        topChar = "\u{FFFF}",
        bottomChar = "\u{0000}",
        topNumber = 1 / 0,
        bottomNumber = -1 / 0
    }

  end)()
  local topInt = foreign.topInt
  local bottomInt = foreign.bottomInt
  local topChar = foreign.topChar
  local bottomChar = foreign.bottomChar
  local topNumber = foreign.topNumber
  local bottomNumber = foreign.bottomNumber
  local ordRecord = Data_Ord.ordRecord(Prim.undefined)
  local BoundedRecord_S_Dict = function(x_0) return x_0 end
  local Bounded_S_Dict = function(x_1) return x_1 end
  local topRecord = function(dict_2) local v = dict_2 return v.topRecord end
  local top = function(dict_3) local v = dict_3 return v.top end
  local boundedUnit = {
    top = Data_Unit.unit,
    bottom = Data_Unit.unit,
    Ord0 = function() return Data_Ord.ordUnit end
  }
  local boundedRecordNil = {
    topRecord = function(v_4) return function(v1_5) return {} end end,
    bottomRecord = function(v_6) return function(v1_7) return {} end end,
    OrdRecord0 = function() return Data_Ord.ordRecordNil end
  }
  local boundedProxy = {
    bottom = Type_Proxy.Proxy,
    top = Type_Proxy.Proxy,
    Ord0 = function() return Data_Ord.ordProxy end
  }
  local boundedOrdering = {
    top = Data_Ordering.GT,
    bottom = Data_Ordering.LT,
    Ord0 = function() return Data_Ord.ordOrdering end
  }
  local boundedNumber = {
    top = topNumber,
    bottom = bottomNumber,
    Ord0 = function() return Data_Ord.ordNumber end
  }
  local boundedInt = {
    top = topInt,
    bottom = bottomInt,
    Ord0 = function() return Data_Ord.ordInt end
  }
  local boundedChar = {
    top = topChar,
    bottom = bottomChar,
    Ord0 = function() return Data_Ord.ordChar end
  }
  local boundedBoolean = {
    top = true,
    bottom = false,
    Ord0 = function() return Data_Ord.ordBoolean end
  }
  local bottomRecord = function(dict_8)
    local v = dict_8
    return v.bottomRecord
  end
  local boundedRecord = function()
    return function(dictBoundedRecord_9)
      local ordRecord1 = ordRecord(dictBoundedRecord_9.OrdRecord0(Prim.undefined))
      return {
        top = ((topRecord(dictBoundedRecord_9))(Type_Proxy.Proxy))(Type_Proxy.Proxy),
        bottom = ((bottomRecord(dictBoundedRecord_9))(Type_Proxy.Proxy))(Type_Proxy.Proxy),
        Ord0 = function() return ordRecord1 end
      }
    end
  end
  local bottom = function(dict_10) local v = dict_10 return v.bottom end
  local boundedRecordCons = function(dictIsSymbol_11)
    local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_11)
    return function(dictBounded_12)
      return (function()
        local top1 = top(dictBounded_12)
        local bottom1 = bottom(dictBounded_12)
        local Ord0 = dictBounded_12.Ord0(Prim.undefined)
        return function()
          return function()
            return function(dictBoundedRecord_13)
              return (function()
                local topRecord1 = topRecord(dictBoundedRecord_13)
                local bottomRecord1 = bottomRecord(dictBoundedRecord_13)
                local ordRecordCons = (((Data_Ord.ordRecordCons(dictBoundedRecord_13.OrdRecord0(Prim.undefined)))(Prim.undefined))(dictIsSymbol_11))(Ord0)
                return {
                  topRecord = function(v_14)
                    return function(rowProxy_15)
                      return (function()
                        local tail = (topRecord1(Type_Proxy.Proxy))(rowProxy_15)
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local insert = Record_Unsafe.unsafeSet(key)
                        return (insert(top1))(tail)
                      end)()
                    end
                  end,
                  bottomRecord = function(v_16)
                    return function(rowProxy_17)
                      return (function()
                        local tail = (bottomRecord1(Type_Proxy.Proxy))(rowProxy_17)
                        local key = reflectSymbol(Type_Proxy.Proxy)
                        local insert = Record_Unsafe.unsafeSet(key)
                        return (insert(bottom1))(tail)
                      end)()
                    end
                  end,
                  OrdRecord0 = function() return ordRecordCons end
                }
              end)()
            end
          end
        end
      end)()
    end
  end
  return {
    bottom = bottom,
    top = top,
    bottomRecord = bottomRecord,
    topRecord = topRecord,
    boundedBoolean = boundedBoolean,
    boundedInt = boundedInt,
    boundedChar = boundedChar,
    boundedOrdering = boundedOrdering,
    boundedUnit = boundedUnit,
    boundedNumber = boundedNumber,
    boundedProxy = boundedProxy,
    boundedRecordNil = boundedRecordNil,
    boundedRecordCons = boundedRecordCons,
    boundedRecord = boundedRecord
  }
end)()
local Data_CommutativeRing = (function()
  local ringRecord = Data_Ring.ringRecord(Prim.undefined)
  local CommutativeRingRecord_S_Dict = function(x_0) return x_0 end
  local CommutativeRing_S_Dict = function(x_1) return x_1 end
  local commutativeRingUnit = {
    Ring0 = function() return Data_Ring.ringUnit end
  }
  local commutativeRingRecordNil = {
    RingRecord0 = function() return Data_Ring.ringRecordNil end
  }
  local commutativeRingRecordCons = function(dictIsSymbol_2)
    local ringRecordCons = (Data_Ring.ringRecordCons(dictIsSymbol_2))(Prim.undefined)
    return function()
      return function(dictCommutativeRingRecord_3)
        return (function()
          local ringRecordCons1 = ringRecordCons(dictCommutativeRingRecord_3.RingRecord0(Prim.undefined))
          return function(dictCommutativeRing_4)
            return (function()
              local ringRecordCons2 = ringRecordCons1(dictCommutativeRing_4.Ring0(Prim.undefined))
              return { RingRecord0 = function() return ringRecordCons2 end }
            end)()
          end
        end)()
      end
    end
  end
  local commutativeRingRecord = function()
    return function(dictCommutativeRingRecord_5)
      local ringRecord1 = ringRecord(dictCommutativeRingRecord_5.RingRecord0(Prim.undefined))
      return { Ring0 = function() return ringRecord1 end }
    end
  end
  local commutativeRingProxy = {
    Ring0 = function() return Data_Ring.ringProxy end
  }
  local commutativeRingNumber = {
    Ring0 = function() return Data_Ring.ringNumber end
  }
  local commutativeRingInt = { Ring0 = function() return Data_Ring.ringInt end }
  local commutativeRingFn = function(dictCommutativeRing_6)
    local ringFn = Data_Ring.ringFn(dictCommutativeRing_6.Ring0(Prim.undefined))
    return { Ring0 = function() return ringFn end }
  end
  return {
    commutativeRingInt = commutativeRingInt,
    commutativeRingNumber = commutativeRingNumber,
    commutativeRingUnit = commutativeRingUnit,
    commutativeRingFn = commutativeRingFn,
    commutativeRingRecord = commutativeRingRecord,
    commutativeRingProxy = commutativeRingProxy,
    commutativeRingRecordNil = commutativeRingRecordNil,
    commutativeRingRecordCons = commutativeRingRecordCons
  }
end)()
local Data_EuclideanRing = (function()
  local foreign = (function()
    return {
        intDegree = function(x) return math.min(math.abs(x), math.maxinteger) end,
        intDiv = function(x) return function(y)
                if y == 0 then return 0 end
                return y > 0 and math.floor(x / y) or -math.floor(x / -y)
            end
        end,
        intMod = function(x) return function(y)
                if y == 0 then return 0 end
                local yy = math.abs(y)
                return ((x % yy) + yy) % yy
            end
        end,
        numDiv = function(n1) return function(n2) return n1 / n2 end end,
    }

  end)()
  local intDegree = foreign.intDegree
  local intDiv = foreign.intDiv
  local intMod = foreign.intMod
  local numDiv = foreign.numDiv
  local disj = Data_HeytingAlgebra.disj(Data_HeytingAlgebra.heytingAlgebraBoolean)
  local EuclideanRing_S_Dict = function(x_0) return x_0 end
  local mod = function(dict_1) local v = dict_1 return v.mod end
  local gcd
  gcd = function(dictEq_2)
    local eq = Data_Eq.eq(dictEq_2)
    return function(dictEuclideanRing_3)
      return (function()
        local zero = Data_Semiring.zero(dictEuclideanRing_3.CommutativeRing0(Prim.undefined).Ring0(Prim.undefined).Semiring0(Prim.undefined))
        local mod1 = mod(dictEuclideanRing_3)
        return function(a_4)
          return function(b_5)
            return (function()
              local e1 = (eq(b_5))(zero)
              return (function()
                if true == e1 then
                  return a_4
                else
                  return (((gcd(dictEq_2))(dictEuclideanRing_3))(b_5))((mod1(a_4))(b_5))
                end
              end)()
            end)()
          end
        end
      end)()
    end
  end
  local euclideanRingNumber = {
    degree = function(v_6) return 1 end,
    div = numDiv,
    mod = function(v_7) return function(v1_8) return 0.0 end end,
    CommutativeRing0 = function()
      return Data_CommutativeRing.commutativeRingNumber
    end
  }
  local euclideanRingInt = {
    degree = intDegree,
    div = intDiv,
    mod = intMod,
    CommutativeRing0 = function()
      return Data_CommutativeRing.commutativeRingInt
    end
  }
  local div = function(dict_9) local v = dict_9 return v.div end
  local lcm = function(dictEq_10)
    local eq = Data_Eq.eq(dictEq_10)
    local gcd1 = gcd(dictEq_10)
    return function(dictEuclideanRing_11)
      return (function()
        local Semiring0 = dictEuclideanRing_11.CommutativeRing0(Prim.undefined).Ring0(Prim.undefined).Semiring0(Prim.undefined)
        local zero = Data_Semiring.zero(Semiring0)
        local div1 = div(dictEuclideanRing_11)
        local mul = Data_Semiring.mul(Semiring0)
        local gcd2 = gcd1(dictEuclideanRing_11)
        return function(a_12)
          return function(b_13)
            return (function()
              local e3 = (disj((eq(a_12))(zero)))((eq(b_13))(zero))
              return (function()
                if true == e3 then
                  return zero
                else
                  return (div1((mul(a_12))(b_13)))((gcd2(a_12))(b_13))
                end
              end)()
            end)()
          end
        end
      end)()
    end
  end
  local degree = function(dict_14) local v = dict_14 return v.degree end
  return {
    degree = degree,
    div = div,
    mod = mod,
    gcd = gcd,
    lcm = lcm,
    euclideanRingInt = euclideanRingInt,
    euclideanRingNumber = euclideanRingNumber
  }
end)()
local Data_Monoid = (function()
  local semigroupRecord = Data_Semigroup.semigroupRecord(Prim.undefined)
  local lessThanOrEq = Data_Ord.lessThanOrEq(Data_Ord.ordInt)
  local eq = Data_Eq.eq(Data_Eq.eqInt)
  local mod = Data_EuclideanRing.mod(Data_EuclideanRing.euclideanRingInt)
  local div = Data_EuclideanRing.div(Data_EuclideanRing.euclideanRingInt)
  local MonoidRecord_S_Dict = function(x_0) return x_0 end
  local Monoid_S_Dict = function(x_1) return x_1 end
  local monoidUnit = {
    mempty = Data_Unit.unit,
    Semigroup0 = function() return Data_Semigroup.semigroupUnit end
  }
  local monoidString = {
    mempty = "",
    Semigroup0 = function() return Data_Semigroup.semigroupString end
  }
  local monoidRecordNil = {
    memptyRecord = function(v_2) return {} end,
    SemigroupRecord0 = function() return Data_Semigroup.semigroupRecordNil end
  }
  local monoidOrdering = {
    mempty = Data_Ordering.EQ,
    Semigroup0 = function() return Data_Ordering.semigroupOrdering end
  }
  local monoidArray = {
    mempty = {},
    Semigroup0 = function() return Data_Semigroup.semigroupArray end
  }
  local memptyRecord = function(dict_3)
    local v = dict_3
    return v.memptyRecord
  end
  local monoidRecord = function()
    return function(dictMonoidRecord_4)
      local semigroupRecord1 = semigroupRecord(dictMonoidRecord_4.SemigroupRecord0(Prim.undefined))
      return {
        mempty = (memptyRecord(dictMonoidRecord_4))(Type_Proxy.Proxy),
        Semigroup0 = function() return semigroupRecord1 end
      }
    end
  end
  local mempty = function(dict_5) local v = dict_5 return v.mempty end
  local monoidFn = function(dictMonoid_6)
    local mempty1 = mempty(dictMonoid_6)
    local semigroupFn = Data_Semigroup.semigroupFn(dictMonoid_6.Semigroup0(Prim.undefined))
    return {
      mempty = function(v_7) return mempty1 end,
      Semigroup0 = function() return semigroupFn end
    }
  end
  local monoidRecordCons = function(dictIsSymbol_8)
    local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_8)
    local semigroupRecordCons = (Data_Semigroup.semigroupRecordCons(dictIsSymbol_8))(Prim.undefined)
    return function(dictMonoid_9)
      return (function()
        local mempty1 = mempty(dictMonoid_9)
        local Semigroup0 = dictMonoid_9.Semigroup0(Prim.undefined)
        return function()
          return function(dictMonoidRecord_10)
            return (function()
              local memptyRecord1 = memptyRecord(dictMonoidRecord_10)
              local semigroupRecordCons1 = (semigroupRecordCons(dictMonoidRecord_10.SemigroupRecord0(Prim.undefined)))(Semigroup0)
              return {
                memptyRecord = function(v_11)
                  return (function()
                    local tail = memptyRecord1(Type_Proxy.Proxy)
                    local key = reflectSymbol(Type_Proxy.Proxy)
                    local insert = Record_Unsafe.unsafeSet(key)
                    return (insert(mempty1))(tail)
                  end)()
                end,
                SemigroupRecord0 = function() return semigroupRecordCons1 end
              }
            end)()
          end
        end
      end)()
    end
  end
  local power = function(dictMonoid_12)
    local mempty1 = mempty(dictMonoid_12)
    local append = Data_Semigroup.append(dictMonoid_12.Semigroup0(Prim.undefined))
    return function(x_13)
      return (function()
        local go
        go = function(p_14)
          return (function()
            local n2 = error("No patterns matched")
            local p1 = p_14
            return (function()
              if (lessThanOrEq(p1))(0) then
                return mempty1
              else
                return (function()
                  if (eq(p1))(1) then
                    return x_13
                  else
                    return (function()
                      if (eq((mod(p1))(2)))(0) then
                        return (function()
                          local xPrime = go((div(p1))(2))
                          return (append(xPrime))(xPrime)
                        end)()
                      else
                        return (function()
                          if Data_Boolean.otherwise then
                            return (function()
                              local xPrime = go((div(p1))(2))
                              return (append(xPrime))((append(xPrime))(x_13))
                            end)()
                          else
                            return n2
                          end
                        end)()
                      end
                    end)()
                  end
                end)()
              end
            end)()
          end)()
        end
        return go
      end)()
    end
  end
  local guard = function(dictMonoid_15)
    local mempty1 = mempty(dictMonoid_15)
    return function(v_16)
      return function(v1_17)
        return (function()
          if true == v_16 then
            return (function() local a = v1_17 return a end)()
          else
            return (function()
              if false == v_16 then
                return mempty1
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)()
      end
    end
  end
  return {
    mempty = mempty,
    power = power,
    guard = guard,
    memptyRecord = memptyRecord,
    monoidUnit = monoidUnit,
    monoidOrdering = monoidOrdering,
    monoidFn = monoidFn,
    monoidString = monoidString,
    monoidArray = monoidArray,
    monoidRecord = monoidRecord,
    monoidRecordNil = monoidRecordNil,
    monoidRecordCons = monoidRecordCons
  }
end)()
local Data_DivisionRing = (function()
  local div = Data_EuclideanRing.div(Data_EuclideanRing.euclideanRingNumber)
  local DivisionRing_S_Dict = function(x_0) return x_0 end
  local recip = function(dict_1) local v = dict_1 return v.recip end
  local rightDiv = function(dictDivisionRing_2)
    local mul = Data_Semiring.mul(dictDivisionRing_2.Ring0(Prim.undefined).Semiring0(Prim.undefined))
    local recip1 = recip(dictDivisionRing_2)
    return function(a_3)
      return function(b_4) return (mul(a_3))(recip1(b_4)) end
    end
  end
  local leftDiv = function(dictDivisionRing_5)
    local mul = Data_Semiring.mul(dictDivisionRing_5.Ring0(Prim.undefined).Semiring0(Prim.undefined))
    local recip1 = recip(dictDivisionRing_5)
    return function(a_6)
      return function(b_7) return (mul(recip1(b_7)))(a_6) end
    end
  end
  local divisionringNumber = {
    recip = function(x_8) return (div(1.0))(x_8) end,
    Ring0 = function() return Data_Ring.ringNumber end
  }
  return {
    recip = recip,
    leftDiv = leftDiv,
    rightDiv = rightDiv,
    divisionringNumber = divisionringNumber
  }
end)()
local Data_Field = (function()
  local Field_S_Dict = function(x_0) return x_0 end
  local field = function(dictEuclideanRing_1)
    return function(dictDivisionRing_2)
      return {
        EuclideanRing0 = function() return dictEuclideanRing_1 end,
        DivisionRing1 = function() return dictDivisionRing_2 end
      }
    end
  end
  return { field = field }
end)()
local Data_NaturalTransformation = (function() return {} end)()
local Prelude = (function() return {} end)()
local Data_Monoid_Additive = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Additive = function(x_0) return x_0 end
  local showAdditive = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(Additive "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semigroupAdditive = function(dictSemiring_3)
    local add = Data_Semiring.add(dictSemiring_3)
    return {
      append = function(v_4)
        return function(v1_5)
          return (function()
            local b = v1_5
            local a = v_4
            return (add(a))(b)
          end)()
        end
      end
    }
  end
  local ordAdditive = function(dictOrd_6) return dictOrd_6 end
  local monoidAdditive = function(dictSemiring_7)
    local semigroupAdditive1 = semigroupAdditive(dictSemiring_7)
    return {
      mempty = Data_Semiring.zero(dictSemiring_7),
      Semigroup0 = function() return semigroupAdditive1 end
    }
  end
  local functorAdditive = {
    map = function(f_8) return function(m_9) local v = m_9 return f_8(v) end end
  }
  local eqAdditive = function(dictEq_10) return dictEq_10 end
  local eq1Additive = {
    eq1 = function(dictEq_11) return Data_Eq.eq(eqAdditive(dictEq_11)) end
  }
  local ord1Additive = {
    compare1 = function(dictOrd_12)
      return Data_Ord.compare(ordAdditive(dictOrd_12))
    end,
    Eq10 = function() return eq1Additive end
  }
  local boundedAdditive = function(dictBounded_13) return dictBounded_13 end
  local applyAdditive = {
    apply = function(v_14)
      return function(v1_15) local x = v1_15 local f = v_14 return f(x) end
    end,
    Functor0 = function() return functorAdditive end
  }
  local bindAdditive = {
    bind = function(v_16)
      return function(f_17) local f1 = f_17 local x = v_16 return f1(x) end
    end,
    Apply0 = function() return applyAdditive end
  }
  local applicativeAdditive = {
    pure = Additive,
    Apply0 = function() return applyAdditive end
  }
  local monadAdditive = {
    Applicative0 = function() return applicativeAdditive end,
    Bind1 = function() return bindAdditive end
  }
  return {
    Additive = Additive,
    eqAdditive = eqAdditive,
    eq1Additive = eq1Additive,
    ordAdditive = ordAdditive,
    ord1Additive = ord1Additive,
    boundedAdditive = boundedAdditive,
    showAdditive = showAdditive,
    functorAdditive = functorAdditive,
    applyAdditive = applyAdditive,
    applicativeAdditive = applicativeAdditive,
    bindAdditive = bindAdditive,
    monadAdditive = monadAdditive,
    semigroupAdditive = semigroupAdditive,
    monoidAdditive = monoidAdditive
  }
end)()
local Data_Monoid_Conj = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Conj = function(x_0) return x_0 end
  local showConj = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(Conj "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semiringConj = function(dictHeytingAlgebra_3)
    local conj = Data_HeytingAlgebra.conj(dictHeytingAlgebra_3)
    local disj = Data_HeytingAlgebra.disj(dictHeytingAlgebra_3)
    return {
      zero = Data_HeytingAlgebra.tt(dictHeytingAlgebra_3),
      one = Data_HeytingAlgebra.ff(dictHeytingAlgebra_3),
      add = function(v_4)
        return function(v1_5)
          return (function()
            local b = v1_5
            local a = v_4
            return (conj(a))(b)
          end)()
        end
      end,
      mul = function(v_6)
        return function(v1_7)
          return (function()
            local b = v1_7
            local a = v_6
            return (disj(a))(b)
          end)()
        end
      end
    }
  end
  local semigroupConj = function(dictHeytingAlgebra_8)
    local conj = Data_HeytingAlgebra.conj(dictHeytingAlgebra_8)
    return {
      append = function(v_9)
        return function(v1_10)
          return (function()
            local b = v1_10
            local a = v_9
            return (conj(a))(b)
          end)()
        end
      end
    }
  end
  local ordConj = function(dictOrd_11) return dictOrd_11 end
  local monoidConj = function(dictHeytingAlgebra_12)
    local semigroupConj1 = semigroupConj(dictHeytingAlgebra_12)
    return {
      mempty = Data_HeytingAlgebra.tt(dictHeytingAlgebra_12),
      Semigroup0 = function() return semigroupConj1 end
    }
  end
  local functorConj = {
    map = function(f_13)
      return function(m_14) local v = m_14 return f_13(v) end
    end
  }
  local eqConj = function(dictEq_15) return dictEq_15 end
  local eq1Conj = {
    eq1 = function(dictEq_16) return Data_Eq.eq(eqConj(dictEq_16)) end
  }
  local ord1Conj = {
    compare1 = function(dictOrd_17)
      return Data_Ord.compare(ordConj(dictOrd_17))
    end,
    Eq10 = function() return eq1Conj end
  }
  local boundedConj = function(dictBounded_18) return dictBounded_18 end
  local applyConj = {
    apply = function(v_19)
      return function(v1_20) local x = v1_20 local f = v_19 return f(x) end
    end,
    Functor0 = function() return functorConj end
  }
  local bindConj = {
    bind = function(v_21)
      return function(f_22) local f1 = f_22 local x = v_21 return f1(x) end
    end,
    Apply0 = function() return applyConj end
  }
  local applicativeConj = {
    pure = Conj,
    Apply0 = function() return applyConj end
  }
  local monadConj = {
    Applicative0 = function() return applicativeConj end,
    Bind1 = function() return bindConj end
  }
  return {
    Conj = Conj,
    eqConj = eqConj,
    eq1Conj = eq1Conj,
    ordConj = ordConj,
    ord1Conj = ord1Conj,
    boundedConj = boundedConj,
    showConj = showConj,
    functorConj = functorConj,
    applyConj = applyConj,
    applicativeConj = applicativeConj,
    bindConj = bindConj,
    monadConj = monadConj,
    semigroupConj = semigroupConj,
    monoidConj = monoidConj,
    semiringConj = semiringConj
  }
end)()
local Data_Monoid_Disj = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Disj = function(x_0) return x_0 end
  local showDisj = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(Disj "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semiringDisj = function(dictHeytingAlgebra_3)
    local disj = Data_HeytingAlgebra.disj(dictHeytingAlgebra_3)
    local conj = Data_HeytingAlgebra.conj(dictHeytingAlgebra_3)
    return {
      zero = Data_HeytingAlgebra.ff(dictHeytingAlgebra_3),
      one = Data_HeytingAlgebra.tt(dictHeytingAlgebra_3),
      add = function(v_4)
        return function(v1_5)
          return (function()
            local b = v1_5
            local a = v_4
            return (disj(a))(b)
          end)()
        end
      end,
      mul = function(v_6)
        return function(v1_7)
          return (function()
            local b = v1_7
            local a = v_6
            return (conj(a))(b)
          end)()
        end
      end
    }
  end
  local semigroupDisj = function(dictHeytingAlgebra_8)
    local disj = Data_HeytingAlgebra.disj(dictHeytingAlgebra_8)
    return {
      append = function(v_9)
        return function(v1_10)
          return (function()
            local b = v1_10
            local a = v_9
            return (disj(a))(b)
          end)()
        end
      end
    }
  end
  local ordDisj = function(dictOrd_11) return dictOrd_11 end
  local monoidDisj = function(dictHeytingAlgebra_12)
    local semigroupDisj1 = semigroupDisj(dictHeytingAlgebra_12)
    return {
      mempty = Data_HeytingAlgebra.ff(dictHeytingAlgebra_12),
      Semigroup0 = function() return semigroupDisj1 end
    }
  end
  local functorDisj = {
    map = function(f_13)
      return function(m_14) local v = m_14 return f_13(v) end
    end
  }
  local eqDisj = function(dictEq_15) return dictEq_15 end
  local eq1Disj = {
    eq1 = function(dictEq_16) return Data_Eq.eq(eqDisj(dictEq_16)) end
  }
  local ord1Disj = {
    compare1 = function(dictOrd_17)
      return Data_Ord.compare(ordDisj(dictOrd_17))
    end,
    Eq10 = function() return eq1Disj end
  }
  local boundedDisj = function(dictBounded_18) return dictBounded_18 end
  local applyDisj = {
    apply = function(v_19)
      return function(v1_20) local x = v1_20 local f = v_19 return f(x) end
    end,
    Functor0 = function() return functorDisj end
  }
  local bindDisj = {
    bind = function(v_21)
      return function(f_22) local f1 = f_22 local x = v_21 return f1(x) end
    end,
    Apply0 = function() return applyDisj end
  }
  local applicativeDisj = {
    pure = Disj,
    Apply0 = function() return applyDisj end
  }
  local monadDisj = {
    Applicative0 = function() return applicativeDisj end,
    Bind1 = function() return bindDisj end
  }
  return {
    Disj = Disj,
    eqDisj = eqDisj,
    eq1Disj = eq1Disj,
    ordDisj = ordDisj,
    ord1Disj = ord1Disj,
    boundedDisj = boundedDisj,
    showDisj = showDisj,
    functorDisj = functorDisj,
    applyDisj = applyDisj,
    applicativeDisj = applicativeDisj,
    bindDisj = bindDisj,
    monadDisj = monadDisj,
    semigroupDisj = semigroupDisj,
    monoidDisj = monoidDisj,
    semiringDisj = semiringDisj
  }
end)()
local Data_Monoid_Dual = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Dual = function(x_0) return x_0 end
  local showDual = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(Dual "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semigroupDual = function(dictSemigroup_3)
    local append1 = Data_Semigroup.append(dictSemigroup_3)
    return {
      append = function(v_4)
        return function(v1_5)
          return (function()
            local y = v1_5
            local x = v_4
            return (append1(y))(x)
          end)()
        end
      end
    }
  end
  local ordDual = function(dictOrd_6) return dictOrd_6 end
  local monoidDual = function(dictMonoid_7)
    local semigroupDual1 = semigroupDual(dictMonoid_7.Semigroup0(Prim.undefined))
    return {
      mempty = Data_Monoid.mempty(dictMonoid_7),
      Semigroup0 = function() return semigroupDual1 end
    }
  end
  local functorDual = {
    map = function(f_8) return function(m_9) local v = m_9 return f_8(v) end end
  }
  local eqDual = function(dictEq_10) return dictEq_10 end
  local eq1Dual = {
    eq1 = function(dictEq_11) return Data_Eq.eq(eqDual(dictEq_11)) end
  }
  local ord1Dual = {
    compare1 = function(dictOrd_12)
      return Data_Ord.compare(ordDual(dictOrd_12))
    end,
    Eq10 = function() return eq1Dual end
  }
  local boundedDual = function(dictBounded_13) return dictBounded_13 end
  local applyDual = {
    apply = function(v_14)
      return function(v1_15) local x = v1_15 local f = v_14 return f(x) end
    end,
    Functor0 = function() return functorDual end
  }
  local bindDual = {
    bind = function(v_16)
      return function(f_17) local f1 = f_17 local x = v_16 return f1(x) end
    end,
    Apply0 = function() return applyDual end
  }
  local applicativeDual = {
    pure = Dual,
    Apply0 = function() return applyDual end
  }
  local monadDual = {
    Applicative0 = function() return applicativeDual end,
    Bind1 = function() return bindDual end
  }
  return {
    Dual = Dual,
    eqDual = eqDual,
    eq1Dual = eq1Dual,
    ordDual = ordDual,
    ord1Dual = ord1Dual,
    boundedDual = boundedDual,
    showDual = showDual,
    functorDual = functorDual,
    applyDual = applyDual,
    applicativeDual = applicativeDual,
    bindDual = bindDual,
    monadDual = monadDual,
    semigroupDual = semigroupDual,
    monoidDual = monoidDual
  }
end)()
local Data_Monoid_Endo = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Endo = function(x_0) return x_0 end
  local showEndo = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local x = v_2
          return (append("(Endo "))((append(show(x)))(")"))
        end)()
      end
    }
  end
  local semigroupEndo = function(dictSemigroupoid_3)
    local compose = Control_Semigroupoid.compose(dictSemigroupoid_3)
    return {
      append = function(v_4)
        return function(v1_5)
          return (function()
            local b = v1_5
            local a = v_4
            return (compose(a))(b)
          end)()
        end
      end
    }
  end
  local ordEndo = function(dictOrd_6) return dictOrd_6 end
  local monoidEndo = function(dictCategory_7)
    local semigroupEndo1 = semigroupEndo(dictCategory_7.Semigroupoid0(Prim.undefined))
    return {
      mempty = Control_Category.identity(dictCategory_7),
      Semigroup0 = function() return semigroupEndo1 end
    }
  end
  local eqEndo = function(dictEq_8) return dictEq_8 end
  local boundedEndo = function(dictBounded_9) return dictBounded_9 end
  return {
    Endo = Endo,
    eqEndo = eqEndo,
    ordEndo = ordEndo,
    boundedEndo = boundedEndo,
    showEndo = showEndo,
    semigroupEndo = semigroupEndo,
    monoidEndo = monoidEndo
  }
end)()
local Data_Monoid_Multiplicative = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Multiplicative = function(x_0) return x_0 end
  local showMultiplicative = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(Multiplicative "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semigroupMultiplicative = function(dictSemiring_3)
    local mul = Data_Semiring.mul(dictSemiring_3)
    return {
      append = function(v_4)
        return function(v1_5)
          return (function()
            local b = v1_5
            local a = v_4
            return (mul(a))(b)
          end)()
        end
      end
    }
  end
  local ordMultiplicative = function(dictOrd_6) return dictOrd_6 end
  local monoidMultiplicative = function(dictSemiring_7)
    local semigroupMultiplicative1 = semigroupMultiplicative(dictSemiring_7)
    return {
      mempty = Data_Semiring.one(dictSemiring_7),
      Semigroup0 = function() return semigroupMultiplicative1 end
    }
  end
  local functorMultiplicative = {
    map = function(f_8) return function(m_9) local v = m_9 return f_8(v) end end
  }
  local eqMultiplicative = function(dictEq_10) return dictEq_10 end
  local eq1Multiplicative = {
    eq1 = function(dictEq_11) return Data_Eq.eq(eqMultiplicative(dictEq_11)) end
  }
  local ord1Multiplicative = {
    compare1 = function(dictOrd_12)
      return Data_Ord.compare(ordMultiplicative(dictOrd_12))
    end,
    Eq10 = function() return eq1Multiplicative end
  }
  local boundedMultiplicative = function(dictBounded_13)
    return dictBounded_13
  end
  local applyMultiplicative = {
    apply = function(v_14)
      return function(v1_15) local x = v1_15 local f = v_14 return f(x) end
    end,
    Functor0 = function() return functorMultiplicative end
  }
  local bindMultiplicative = {
    bind = function(v_16)
      return function(f_17) local f1 = f_17 local x = v_16 return f1(x) end
    end,
    Apply0 = function() return applyMultiplicative end
  }
  local applicativeMultiplicative = {
    pure = Multiplicative,
    Apply0 = function() return applyMultiplicative end
  }
  local monadMultiplicative = {
    Applicative0 = function() return applicativeMultiplicative end,
    Bind1 = function() return bindMultiplicative end
  }
  return {
    Multiplicative = Multiplicative,
    eqMultiplicative = eqMultiplicative,
    eq1Multiplicative = eq1Multiplicative,
    ordMultiplicative = ordMultiplicative,
    ord1Multiplicative = ord1Multiplicative,
    boundedMultiplicative = boundedMultiplicative,
    showMultiplicative = showMultiplicative,
    functorMultiplicative = functorMultiplicative,
    applyMultiplicative = applyMultiplicative,
    applicativeMultiplicative = applicativeMultiplicative,
    bindMultiplicative = bindMultiplicative,
    monadMultiplicative = monadMultiplicative,
    semigroupMultiplicative = semigroupMultiplicative,
    monoidMultiplicative = monoidMultiplicative
  }
end)()
local Data_Semigroup_First = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local First = function(x_0) return x_0 end
  local showFirst = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(First "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semigroupFirst = {
    append = function(x_3) return function(v_4) return x_3 end end
  }
  local ordFirst = function(dictOrd_5) return dictOrd_5 end
  local functorFirst = {
    map = function(f_6) return function(m_7) local v = m_7 return f_6(v) end end
  }
  local eqFirst = function(dictEq_8) return dictEq_8 end
  local eq1First = {
    eq1 = function(dictEq_9) return Data_Eq.eq(eqFirst(dictEq_9)) end
  }
  local ord1First = {
    compare1 = function(dictOrd_10)
      return Data_Ord.compare(ordFirst(dictOrd_10))
    end,
    Eq10 = function() return eq1First end
  }
  local boundedFirst = function(dictBounded_11) return dictBounded_11 end
  local applyFirst = {
    apply = function(v_12)
      return function(v1_13) local x = v1_13 local f = v_12 return f(x) end
    end,
    Functor0 = function() return functorFirst end
  }
  local bindFirst = {
    bind = function(v_14)
      return function(f_15) local f1 = f_15 local x = v_14 return f1(x) end
    end,
    Apply0 = function() return applyFirst end
  }
  local applicativeFirst = {
    pure = First,
    Apply0 = function() return applyFirst end
  }
  local monadFirst = {
    Applicative0 = function() return applicativeFirst end,
    Bind1 = function() return bindFirst end
  }
  return {
    First = First,
    eqFirst = eqFirst,
    eq1First = eq1First,
    ordFirst = ordFirst,
    ord1First = ord1First,
    boundedFirst = boundedFirst,
    showFirst = showFirst,
    functorFirst = functorFirst,
    applyFirst = applyFirst,
    applicativeFirst = applicativeFirst,
    bindFirst = bindFirst,
    monadFirst = monadFirst,
    semigroupFirst = semigroupFirst
  }
end)()
local Data_Semigroup_Last = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Last = function(x_0) return x_0 end
  local showLast = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(Last "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semigroupLast = {
    append = function(v_3) return function(x_4) return x_4 end end
  }
  local ordLast = function(dictOrd_5) return dictOrd_5 end
  local functorLast = {
    map = function(f_6) return function(m_7) local v = m_7 return f_6(v) end end
  }
  local eqLast = function(dictEq_8) return dictEq_8 end
  local eq1Last = {
    eq1 = function(dictEq_9) return Data_Eq.eq(eqLast(dictEq_9)) end
  }
  local ord1Last = {
    compare1 = function(dictOrd_10)
      return Data_Ord.compare(ordLast(dictOrd_10))
    end,
    Eq10 = function() return eq1Last end
  }
  local boundedLast = function(dictBounded_11) return dictBounded_11 end
  local applyLast = {
    apply = function(v_12)
      return function(v1_13) local x = v1_13 local f = v_12 return f(x) end
    end,
    Functor0 = function() return functorLast end
  }
  local bindLast = {
    bind = function(v_14)
      return function(f_15) local f1 = f_15 local x = v_14 return f1(x) end
    end,
    Apply0 = function() return applyLast end
  }
  local applicativeLast = {
    pure = Last,
    Apply0 = function() return applyLast end
  }
  local monadLast = {
    Applicative0 = function() return applicativeLast end,
    Bind1 = function() return bindLast end
  }
  return {
    Last = Last,
    eqLast = eqLast,
    eq1Last = eq1Last,
    ordLast = ordLast,
    ord1Last = ord1Last,
    boundedLast = boundedLast,
    showLast = showLast,
    functorLast = functorLast,
    applyLast = applyLast,
    applicativeLast = applicativeLast,
    bindLast = bindLast,
    monadLast = monadLast,
    semigroupLast = semigroupLast
  }
end)()
local Unsafe_Coerce = (function()
  local foreign = (function()
    return { unsafeCoerce = function(x) return x end }

  end)()
  local unsafeCoerce = foreign.unsafeCoerce
  return { unsafeCoerce = unsafeCoerce }
end)()
local Safe_Coerce = (function()
  local coerce = function() return Unsafe_Coerce.unsafeCoerce end
  return { coerce = coerce }
end)()
local Data_Newtype = (function()
  local coerce = Safe_Coerce.coerce(Prim.undefined)
  local Newtype_S_Dict = function(x_0) return x_0 end
  local wrap = function() return coerce end
  local wrap1 = wrap(Prim.undefined)
  local unwrap = function() return coerce end
  local unwrap1 = unwrap(Prim.undefined)
  local underF2 = function()
    return function()
      return function()
        return function() return function(v_1) return coerce end end
      end
    end
  end
  local underF = function()
    return function()
      return function()
        return function() return function(v_2) return coerce end end
      end
    end
  end
  local under2 = function()
    return function() return function(v_3) return coerce end end
  end
  local under = function()
    return function() return function(v_4) return coerce end end
  end
  local un = function() return function(v_5) return unwrap1 end end
  local traverse = function()
    return function() return function(v_6) return coerce end end
  end
  local overF2 = function()
    return function()
      return function()
        return function() return function(v_7) return coerce end end
      end
    end
  end
  local overF = function()
    return function()
      return function()
        return function() return function(v_8) return coerce end end
      end
    end
  end
  local over2 = function()
    return function() return function(v_9) return coerce end end
  end
  local over = function()
    return function() return function(v_10) return coerce end end
  end
  local newtypeMultiplicative = {
    Coercible0 = function() return Prim.undefined end
  }
  local newtypeLast = { Coercible0 = function() return Prim.undefined end }
  local newtypeFirst = { Coercible0 = function() return Prim.undefined end }
  local newtypeEndo = { Coercible0 = function() return Prim.undefined end }
  local newtypeDual = { Coercible0 = function() return Prim.undefined end }
  local newtypeDisj = { Coercible0 = function() return Prim.undefined end }
  local newtypeConj = { Coercible0 = function() return Prim.undefined end }
  local newtypeAdditive = { Coercible0 = function() return Prim.undefined end }
  local modify = function()
    return function(fn_11)
      return function(t_12) return wrap1(fn_11(unwrap1(t_12))) end
    end
  end
  local collect = function()
    return function() return function(v_13) return coerce end end
  end
  local alaF = function()
    return function()
      return function()
        return function() return function(v_14) return coerce end end
      end
    end
  end
  local ala = function()
    return function()
      return function()
        return function(v_15)
          return function(f_16) return coerce(f_16(wrap1)) end
        end
      end
    end
  end
  return {
    wrap = wrap,
    unwrap = unwrap,
    un = un,
    modify = modify,
    ala = ala,
    alaF = alaF,
    over = over,
    overF = overF,
    under = under,
    underF = underF,
    over2 = over2,
    overF2 = overF2,
    under2 = under2,
    underF2 = underF2,
    traverse = traverse,
    collect = collect,
    newtypeAdditive = newtypeAdditive,
    newtypeMultiplicative = newtypeMultiplicative,
    newtypeConj = newtypeConj,
    newtypeDisj = newtypeDisj,
    newtypeDual = newtypeDual,
    newtypeEndo = newtypeEndo,
    newtypeFirst = newtypeFirst,
    newtypeLast = newtypeLast
  }
end)()
local Data_Monoid_Alternate = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Alternate = function(x_0) return x_0 end
  local showAlternate = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(Alternate "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semigroupAlternate = function(dictAlt_3)
    local alt = Control_Alt.alt(dictAlt_3)
    return {
      append = function(v_4)
        return function(v1_5)
          return (function()
            local b = v1_5
            local a = v_4
            return (alt(a))(b)
          end)()
        end
      end
    }
  end
  local plusAlternate = function(dictPlus_6) return dictPlus_6 end
  local ordAlternate = function(dictOrd_7) return dictOrd_7 end
  local ord1Alternate = function(dictOrd1_8) return dictOrd1_8 end
  local newtypeAlternate = { Coercible0 = function() return Prim.undefined end }
  local monoidAlternate = function(dictPlus_9)
    local semigroupAlternate1 = semigroupAlternate(dictPlus_9.Alt0(Prim.undefined))
    return {
      mempty = Control_Plus.empty(dictPlus_9),
      Semigroup0 = function() return semigroupAlternate1 end
    }
  end
  local monadAlternate = function(dictMonad_10) return dictMonad_10 end
  local functorAlternate = function(dictFunctor_11) return dictFunctor_11 end
  local extendAlternate = function(dictExtend_12) return dictExtend_12 end
  local eqAlternate = function(dictEq_13) return dictEq_13 end
  local eq1Alternate = function(dictEq1_14) return dictEq1_14 end
  local comonadAlternate = function(dictComonad_15) return dictComonad_15 end
  local boundedAlternate = function(dictBounded_16) return dictBounded_16 end
  local bindAlternate = function(dictBind_17) return dictBind_17 end
  local applyAlternate = function(dictApply_18) return dictApply_18 end
  local applicativeAlternate = function(dictApplicative_19)
    return dictApplicative_19
  end
  local alternativeAlternate = function(dictAlternative_20)
    return dictAlternative_20
  end
  local altAlternate = function(dictAlt_21) return dictAlt_21 end
  return {
    Alternate = Alternate,
    newtypeAlternate = newtypeAlternate,
    eqAlternate = eqAlternate,
    eq1Alternate = eq1Alternate,
    ordAlternate = ordAlternate,
    ord1Alternate = ord1Alternate,
    boundedAlternate = boundedAlternate,
    functorAlternate = functorAlternate,
    applyAlternate = applyAlternate,
    applicativeAlternate = applicativeAlternate,
    altAlternate = altAlternate,
    plusAlternate = plusAlternate,
    alternativeAlternate = alternativeAlternate,
    bindAlternate = bindAlternate,
    monadAlternate = monadAlternate,
    extendAlternate = extendAlternate,
    comonadAlternate = comonadAlternate,
    showAlternate = showAlternate,
    semigroupAlternate = semigroupAlternate,
    monoidAlternate = monoidAlternate
  }
end)()
local Data_Functor_Invariant = (function()
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local Invariant_S_Dict = function(x_0) return x_0 end
  local invariantMultiplicative = {
    imap = function(f_1)
      return function(v_2)
        return function(v1_3) local x = v1_3 local f1 = f_1 return f1(x) end
      end
    end
  }
  local invariantEndo = {
    imap = function(ab_4)
      return function(ba_5)
        return function(v_6)
          local f = v_6
          local ba1 = ba_5
          local ab1 = ab_4
          return (compose(ab1))((compose(f))(ba1))
        end
      end
    end
  }
  local invariantDual = {
    imap = function(f_7)
      return function(v_8)
        return function(v1_9) local x = v1_9 local f1 = f_7 return f1(x) end
      end
    end
  }
  local invariantDisj = {
    imap = function(f_10)
      return function(v_11)
        return function(v1_12) local x = v1_12 local f1 = f_10 return f1(x) end
      end
    end
  }
  local invariantConj = {
    imap = function(f_13)
      return function(v_14)
        return function(v1_15) local x = v1_15 local f1 = f_13 return f1(x) end
      end
    end
  }
  local invariantAdditive = {
    imap = function(f_16)
      return function(v_17)
        return function(v1_18) local x = v1_18 local f1 = f_16 return f1(x) end
      end
    end
  }
  local imapF = function(dictFunctor_19)
    local map = Data_Functor.map(dictFunctor_19)
    return function(f_20) return function(v_21) return map(f_20) end end
  end
  local invariantArray = { imap = imapF(Data_Functor.functorArray) }
  local invariantFn = { imap = imapF(Data_Functor.functorFn) }
  local imap = function(dict_22) local v = dict_22 return v.imap end
  local invariantAlternate = function(dictInvariant_23)
    local imap1 = imap(dictInvariant_23)
    return {
      imap = function(f_24)
        return function(g_25)
          return function(v_26)
            return (function()
              local x = v_26
              local g1 = g_25
              local f1 = f_24
              return ((imap1(f1))(g1))(x)
            end)()
          end
        end
      end
    }
  end
  return {
    imap = imap,
    imapF = imapF,
    invariantFn = invariantFn,
    invariantArray = invariantArray,
    invariantAdditive = invariantAdditive,
    invariantConj = invariantConj,
    invariantDisj = invariantDisj,
    invariantDual = invariantDual,
    invariantEndo = invariantEndo,
    invariantMultiplicative = invariantMultiplicative,
    invariantAlternate = invariantAlternate
  }
end)()
local Data_Const = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Const = function(x_0) return x_0 end
  local showConst = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local x = v_2
          return (append("(Const "))((append(show(x)))(")"))
        end)()
      end
    }
  end
  local semiringConst = function(dictSemiring_3) return dictSemiring_3 end
  local semigroupoidConst = {
    compose = function(v_4)
      return function(v1_5) local x = v1_5 return x end
    end
  }
  local semigroupConst = function(dictSemigroup_6) return dictSemigroup_6 end
  local ringConst = function(dictRing_7) return dictRing_7 end
  local ordConst = function(dictOrd_8) return dictOrd_8 end
  local newtypeConst = { Coercible0 = function() return Prim.undefined end }
  local monoidConst = function(dictMonoid_9) return dictMonoid_9 end
  local heytingAlgebraConst = function(dictHeytingAlgebra_10)
    return dictHeytingAlgebra_10
  end
  local functorConst = {
    map = function(f_11) return function(m_12) local v = m_12 return v end end
  }
  local invariantConst = { imap = Data_Functor_Invariant.imapF(functorConst) }
  local euclideanRingConst = function(dictEuclideanRing_13)
    return dictEuclideanRing_13
  end
  local eqConst = function(dictEq_14) return dictEq_14 end
  local eq1Const = function(dictEq_15)
    local eq = Data_Eq.eq(eqConst(dictEq_15))
    return { eq1 = function(dictEq1_16) return eq end }
  end
  local ord1Const = function(dictOrd_17)
    local compare = Data_Ord.compare(ordConst(dictOrd_17))
    local eq1Const1 = eq1Const(dictOrd_17.Eq0(Prim.undefined))
    return {
      compare1 = function(dictOrd1_18) return compare end,
      Eq10 = function() return eq1Const1 end
    }
  end
  local commutativeRingConst = function(dictCommutativeRing_19)
    return dictCommutativeRing_19
  end
  local boundedConst = function(dictBounded_20) return dictBounded_20 end
  local booleanAlgebraConst = function(dictBooleanAlgebra_21)
    return dictBooleanAlgebra_21
  end
  local applyConst = function(dictSemigroup_22)
    local append1 = Data_Semigroup.append(dictSemigroup_22)
    return {
      apply = function(v_23)
        return function(v1_24)
          return (function()
            local y = v1_24
            local x = v_23
            return (append1(x))(y)
          end)()
        end
      end,
      Functor0 = function() return functorConst end
    }
  end
  local applicativeConst = function(dictMonoid_25)
    local mempty = Data_Monoid.mempty(dictMonoid_25)
    local applyConst1 = applyConst(dictMonoid_25.Semigroup0(Prim.undefined))
    return {
      pure = function(v_26) return mempty end,
      Apply0 = function() return applyConst1 end
    }
  end
  return {
    Const = Const,
    newtypeConst = newtypeConst,
    eqConst = eqConst,
    eq1Const = eq1Const,
    ordConst = ordConst,
    ord1Const = ord1Const,
    boundedConst = boundedConst,
    showConst = showConst,
    semigroupoidConst = semigroupoidConst,
    semigroupConst = semigroupConst,
    monoidConst = monoidConst,
    semiringConst = semiringConst,
    ringConst = ringConst,
    euclideanRingConst = euclideanRingConst,
    commutativeRingConst = commutativeRingConst,
    heytingAlgebraConst = heytingAlgebraConst,
    booleanAlgebraConst = booleanAlgebraConst,
    functorConst = functorConst,
    invariantConst = invariantConst,
    applyConst = applyConst,
    applicativeConst = applicativeConst
  }
end)()
local Data_Generic_Rep = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local show = Data_Show.show(Data_Show.showString)
  local Inl = function(value0)
    return { ["$ctor"] = "Data_Generic_Rep.Inl", value0 = value0 }
  end
  local Inr = function(value0)
    return { ["$ctor"] = "Data_Generic_Rep.Inr", value0 = value0 }
  end
  local Product = function(value0, value1)
    return {
      ["$ctor"] = "Data_Generic_Rep.Product",
      value0 = value0,
      value1 = value1
    }
  end
  local NoConstructors = function(x_0) return x_0 end
  local NoArguments = function()
    return { ["$ctor"] = "Data_Generic_Rep.NoArguments" }
  end
  local Generic_S_Dict = function(x_1) return x_1 end
  local Constructor = function(x_2) return x_2 end
  local Argument = function(x_3) return x_3 end
  local to = function(dict_4) local v = dict_4 return v.to end
  local showSum = function(dictShow_5)
    local show1 = Data_Show.show(dictShow_5)
    return function(dictShow1_6)
      return (function()
        local show2 = Data_Show.show(dictShow1_6)
        return {
          show = function(v_7)
            return (function()
              if "Data.Generic.Rep.Inl" == v_7["$ctor"] then
                return (function()
                  local a = v_7[0]
                  return (append("(Inl "))((append(show1(a)))(")"))
                end)()
              else
                return (function()
                  if "Data.Generic.Rep.Inr" == v_7["$ctor"] then
                    return (function()
                      local b = v_7[0]
                      return (append("(Inr "))((append(show2(b)))(")"))
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end)()
          end
        }
      end)()
    end
  end
  local showProduct = function(dictShow_8)
    local show1 = Data_Show.show(dictShow_8)
    return function(dictShow1_9)
      return (function()
        local show2 = Data_Show.show(dictShow1_9)
        return {
          show = function(v_10)
            return (function()
              if "Data.Generic.Rep.Product" == v_10["$ctor"] then
                return (function()
                  local b = v_10[1]
                  local a = v_10[0]
                  return (append("(Product "))((append(show1(a)))((append(" "))((append(show2(b)))(")"))))
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        }
      end)()
    end
  end
  local showNoArguments = { show = function(v_11) return "NoArguments" end }
  local showConstructor = function(dictIsSymbol_12)
    local reflectSymbol = Data_Symbol.reflectSymbol(dictIsSymbol_12)
    return function(dictShow_13)
      return (function()
        local show1 = Data_Show.show(dictShow_13)
        return {
          show = function(v_14)
            return (function()
              local a = v_14
              return (append("(Constructor @"))((append(show(reflectSymbol(Type_Proxy.Proxy))))((append(" "))((append(show1(a)))(")"))))
            end)()
          end
        }
      end)()
    end
  end
  local showArgument = function(dictShow_15)
    local show1 = Data_Show.show(dictShow_15)
    return {
      show = function(v_16)
        return (function()
          local a = v_16
          return (append("(Argument "))((append(show1(a)))(")"))
        end)()
      end
    }
  end
  local repOf = function(dictGeneric_17)
    return function(v_18) return Type_Proxy.Proxy end
  end
  local from = function(dict_19) local v = dict_19 return v.from end
  return {
    to = to,
    from = from,
    repOf = repOf,
    NoArguments = NoArguments,
    Inl = Inl,
    Inr = Inr,
    Product = Product,
    Constructor = Constructor,
    Argument = Argument,
    showNoArguments = showNoArguments,
    showSum = showSum,
    showProduct = showProduct,
    showConstructor = showConstructor,
    showArgument = showArgument
  }
end)()
local Data_Maybe = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local identity = Control_Category.identity(Control_Category.categoryFn)
  local Nothing = function() return { ["$ctor"] = "Data_Maybe.Nothing" } end
  local Just = function(value0)
    return { ["$ctor"] = "Data_Maybe.Just", value0 = value0 }
  end
  local showMaybe = function(dictShow_0)
    local show = Data_Show.show(dictShow_0)
    return {
      show = function(v_1)
        return (function()
          if "Data.Maybe.Just" == v_1["$ctor"] then
            return (function()
              local x = v_1[0]
              return (append("(Just "))((append(show(x)))(")"))
            end)()
          else
            return (function()
              if "Data.Maybe.Nothing" == v_1["$ctor"] then
                return "Nothing"
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)()
      end
    }
  end
  local semigroupMaybe = function(dictSemigroup_2)
    local append1 = Data_Semigroup.append(dictSemigroup_2)
    return {
      append = function(v_3)
        return function(v1_4)
          return (function()
            if "Data.Maybe.Nothing" == v_3["$ctor"] then
              return (function() local y = v1_4 return y end)()
            else
              return (function()
                if "Data.Maybe.Nothing" == v1_4["$ctor"] then
                  return (function() local x = v_3 return x end)()
                else
                  return (function()
                    if "Data.Maybe.Just" == v_3["$ctor"] then
                      return (function()
                        if "Data.Maybe.Just" == v1_4["$ctor"] then
                          return (function()
                            local y = v1_4[0]
                            local x = v_3[0]
                            return Just((append1(x))(y))
                          end)()
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end)()
            end
          end)()
        end
      end
    }
  end
  local optional = function(dictAlt_5)
    local alt = Control_Alt.alt(dictAlt_5)
    local map1 = Data_Functor.map(dictAlt_5.Functor0(Prim.undefined))
    return function(dictApplicative_6)
      return (function()
        local pure = Control_Applicative.pure(dictApplicative_6)
        return function(a_7) return (alt((map1(Just))(a_7)))(pure(Nothing)) end
      end)()
    end
  end
  local monoidMaybe = function(dictSemigroup_8)
    local semigroupMaybe1 = semigroupMaybe(dictSemigroup_8)
    return {
      mempty = Nothing,
      Semigroup0 = function() return semigroupMaybe1 end
    }
  end
  local maybePrime = function(v_9)
    return function(v1_10)
      return function(v2_11)
        if "Data.Maybe.Nothing" == v2_11["$ctor"] then
          return (function() local g = v_9 return g(Data_Unit.unit) end)()
        else
          return (function()
            if "Data.Maybe.Just" == v2_11["$ctor"] then
              return (function()
                local a = v2_11[0]
                local f = v1_10
                return f(a)
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end
  end
  local maybe = function(v_12)
    return function(v1_13)
      return function(v2_14)
        if "Data.Maybe.Nothing" == v2_14["$ctor"] then
          return (function() local b = v_12 return b end)()
        else
          return (function()
            if "Data.Maybe.Just" == v2_14["$ctor"] then
              return (function()
                local a = v2_14[0]
                local f = v1_13
                return f(a)
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end
  end
  local isNothing = (maybe(true))(Data_Function.const(false))
  local isJust = (maybe(false))(Data_Function.const(true))
  local genericMaybe = {
    to = function(x_15)
      if "Data.Generic.Rep.Inl" == x_15["$ctor"] then
        return Nothing
      else
        return (function()
          if "Data.Generic.Rep.Inr" == x_15["$ctor"] then
            return (function() local arg = x_15[0] return Just(arg) end)()
          else
            return error("No patterns matched")
          end
        end)()
      end
    end,
    from = function(x_16)
      if "Data.Maybe.Nothing" == x_16["$ctor"] then
        return Data_Generic_Rep.Inl(Data_Generic_Rep.NoArguments)
      else
        return (function()
          if "Data.Maybe.Just" == x_16["$ctor"] then
            return (function()
              local arg = x_16[0]
              return Data_Generic_Rep.Inr(arg)
            end)()
          else
            return error("No patterns matched")
          end
        end)()
      end
    end
  }
  local functorMaybe = {
    map = function(v_17)
      return function(v1_18)
        if "Data.Maybe.Just" == v1_18["$ctor"] then
          return (function()
            local x = v1_18[0]
            local fn = v_17
            return Just(fn(x))
          end)()
        else
          return Nothing
        end
      end
    end
  }
  local map = Data_Functor.map(functorMaybe)
  local invariantMaybe = { imap = Data_Functor_Invariant.imapF(functorMaybe) }
  local fromMaybePrime = function(a_19) return (maybePrime(a_19))(identity) end
  local fromMaybe = function(a_20) return (maybe(a_20))(identity) end
  local fromJust = function()
    return function(v_21)
      return (function()
        return (function()
          if "Data.Maybe.Just" == v_21["$ctor"] then
            return (function() local x = v_21[0] return x end)()
          else
            return error("No patterns matched")
          end
        end)()
      end)(Prim.undefined)
    end
  end
  local extendMaybe = {
    extend = function(v_22)
      return function(v1_23)
        if "Data.Maybe.Nothing" == v1_23["$ctor"] then
          return Nothing
        else
          return (function()
            local x = v1_23
            local f = v_22
            return Just(f(x))
          end)()
        end
      end
    end,
    Functor0 = function() return functorMaybe end
  }
  local eqMaybe = function(dictEq_24)
    local eq = Data_Eq.eq(dictEq_24)
    return {
      eq = function(x_25)
        return function(y_26)
          return (function()
            if "Data.Maybe.Nothing" == x_25["$ctor"] then
              return (function()
                if "Data.Maybe.Nothing" == y_26["$ctor"] then
                  return true
                else
                  return false
                end
              end)()
            else
              return (function()
                if "Data.Maybe.Just" == x_25["$ctor"] then
                  return (function()
                    if "Data.Maybe.Just" == y_26["$ctor"] then
                      return (function()
                        local r = y_26[0]
                        local l = x_25[0]
                        return (eq(l))(r)
                      end)()
                    else
                      return false
                    end
                  end)()
                else
                  return false
                end
              end)()
            end
          end)()
        end
      end
    }
  end
  local ordMaybe = function(dictOrd_27)
    local compare = Data_Ord.compare(dictOrd_27)
    local eqMaybe1 = eqMaybe(dictOrd_27.Eq0(Prim.undefined))
    return {
      compare = function(x_28)
        return function(y_29)
          return (function()
            if "Data.Maybe.Nothing" == x_28["$ctor"] then
              return (function()
                if "Data.Maybe.Nothing" == y_29["$ctor"] then
                  return Data_Ordering.EQ
                else
                  return Data_Ordering.LT
                end
              end)()
            else
              return (function()
                if "Data.Maybe.Nothing" == y_29["$ctor"] then
                  return Data_Ordering.GT
                else
                  return (function()
                    if "Data.Maybe.Just" == x_28["$ctor"] then
                      return (function()
                        if "Data.Maybe.Just" == y_29["$ctor"] then
                          return (function()
                            local r = y_29[0]
                            local l = x_28[0]
                            return (compare(l))(r)
                          end)()
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end)()
            end
          end)()
        end
      end,
      Eq0 = function() return eqMaybe1 end
    }
  end
  local eq1Maybe = {
    eq1 = function(dictEq_30) return Data_Eq.eq(eqMaybe(dictEq_30)) end
  }
  local ord1Maybe = {
    compare1 = function(dictOrd_31)
      return Data_Ord.compare(ordMaybe(dictOrd_31))
    end,
    Eq10 = function() return eq1Maybe end
  }
  local boundedMaybe = function(dictBounded_32)
    local ordMaybe1 = ordMaybe(dictBounded_32.Ord0(Prim.undefined))
    return {
      top = Just(Data_Bounded.top(dictBounded_32)),
      bottom = Nothing,
      Ord0 = function() return ordMaybe1 end
    }
  end
  local applyMaybe = {
    apply = function(v_33)
      return function(v1_34)
        if "Data.Maybe.Just" == v_33["$ctor"] then
          return (function()
            local x = v1_34
            local fn = v_33[0]
            return (map(fn))(x)
          end)()
        else
          return (function()
            if "Data.Maybe.Nothing" == v_33["$ctor"] then
              return Nothing
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end,
    Functor0 = function() return functorMaybe end
  }
  local apply = Control_Apply.apply(applyMaybe)
  local bindMaybe = {
    bind = function(v_35)
      return function(v1_36)
        if "Data.Maybe.Just" == v_35["$ctor"] then
          return (function()
            local k = v1_36
            local x = v_35[0]
            return k(x)
          end)()
        else
          return (function()
            if "Data.Maybe.Nothing" == v_35["$ctor"] then
              return Nothing
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end,
    Apply0 = function() return applyMaybe end
  }
  local semiringMaybe = function(dictSemiring_37)
    local add = Data_Semiring.add(dictSemiring_37)
    local mul = Data_Semiring.mul(dictSemiring_37)
    return {
      zero = Nothing,
      one = Just(Data_Semiring.one(dictSemiring_37)),
      add = function(v_38)
        return function(v1_39)
          return (function()
            if "Data.Maybe.Nothing" == v_38["$ctor"] then
              return (function() local y = v1_39 return y end)()
            else
              return (function()
                if "Data.Maybe.Nothing" == v1_39["$ctor"] then
                  return (function() local x = v_38 return x end)()
                else
                  return (function()
                    if "Data.Maybe.Just" == v_38["$ctor"] then
                      return (function()
                        if "Data.Maybe.Just" == v1_39["$ctor"] then
                          return (function()
                            local y = v1_39[0]
                            local x = v_38[0]
                            return Just((add(x))(y))
                          end)()
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end)()
            end
          end)()
        end
      end,
      mul = function(x_40)
        return function(y_41) return (apply((map(mul))(x_40)))(y_41) end
      end
    }
  end
  local applicativeMaybe = {
    pure = Just,
    Apply0 = function() return applyMaybe end
  }
  local monadMaybe = {
    Applicative0 = function() return applicativeMaybe end,
    Bind1 = function() return bindMaybe end
  }
  local altMaybe = {
    alt = function(v_42)
      return function(v1_43)
        if "Data.Maybe.Nothing" == v_42["$ctor"] then
          return (function() local r = v1_43 return r end)()
        else
          return (function() local l = v_42 return l end)()
        end
      end
    end,
    Functor0 = function() return functorMaybe end
  }
  local plusMaybe = { empty = Nothing, Alt0 = function() return altMaybe end }
  local alternativeMaybe = {
    Applicative0 = function() return applicativeMaybe end,
    Plus1 = function() return plusMaybe end
  }
  return {
    Nothing = Nothing,
    Just = Just,
    maybe = maybe,
    maybePrime = maybePrime,
    fromMaybe = fromMaybe,
    fromMaybePrime = fromMaybePrime,
    isJust = isJust,
    isNothing = isNothing,
    fromJust = fromJust,
    optional = optional,
    functorMaybe = functorMaybe,
    applyMaybe = applyMaybe,
    applicativeMaybe = applicativeMaybe,
    altMaybe = altMaybe,
    plusMaybe = plusMaybe,
    alternativeMaybe = alternativeMaybe,
    bindMaybe = bindMaybe,
    monadMaybe = monadMaybe,
    extendMaybe = extendMaybe,
    invariantMaybe = invariantMaybe,
    semigroupMaybe = semigroupMaybe,
    monoidMaybe = monoidMaybe,
    semiringMaybe = semiringMaybe,
    eqMaybe = eqMaybe,
    eq1Maybe = eq1Maybe,
    ordMaybe = ordMaybe,
    ord1Maybe = ord1Maybe,
    boundedMaybe = boundedMaybe,
    showMaybe = showMaybe,
    genericMaybe = genericMaybe
  }
end)()
local Data_Either = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local Left = function(value0)
    return { ["$ctor"] = "Data_Either.Left", value0 = value0 }
  end
  local Right = function(value0)
    return { ["$ctor"] = "Data_Either.Right", value0 = value0 }
  end
  local showEither = function(dictShow_0)
    local show = Data_Show.show(dictShow_0)
    return function(dictShow1_1)
      return (function()
        local show1 = Data_Show.show(dictShow1_1)
        return {
          show = function(v_2)
            return (function()
              if "Data.Either.Left" == v_2["$ctor"] then
                return (function()
                  local x = v_2[0]
                  return (append("(Left "))((append(show(x)))(")"))
                end)()
              else
                return (function()
                  if "Data.Either.Right" == v_2["$ctor"] then
                    return (function()
                      local y = v_2[0]
                      return (append("(Right "))((append(show1(y)))(")"))
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end)()
          end
        }
      end)()
    end
  end
  local notePrime = function(f_3)
    return (Data_Maybe.maybePrime((compose(Left))(f_3)))(Right)
  end
  local note = function(a_4) return (Data_Maybe.maybe(Left(a_4)))(Right) end
  local genericEither = {
    to = function(x_5)
      if "Data.Generic.Rep.Inl" == x_5["$ctor"] then
        return (function() local arg = x_5[0] return Left(arg) end)()
      else
        return (function()
          if "Data.Generic.Rep.Inr" == x_5["$ctor"] then
            return (function() local arg = x_5[0] return Right(arg) end)()
          else
            return error("No patterns matched")
          end
        end)()
      end
    end,
    from = function(x_6)
      if "Data.Either.Left" == x_6["$ctor"] then
        return (function()
          local arg = x_6[0]
          return Data_Generic_Rep.Inl(arg)
        end)()
      else
        return (function()
          if "Data.Either.Right" == x_6["$ctor"] then
            return (function()
              local arg = x_6[0]
              return Data_Generic_Rep.Inr(arg)
            end)()
          else
            return error("No patterns matched")
          end
        end)()
      end
    end
  }
  local functorEither = {
    map = function(f_7)
      return function(m_8)
        if "Data.Either.Left" == m_8["$ctor"] then
          return (function() local v = m_8[0] return Left(v) end)()
        else
          return (function()
            if "Data.Either.Right" == m_8["$ctor"] then
              return (function() local v = m_8[0] return Right(f_7(v)) end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end
  }
  local map = Data_Functor.map(functorEither)
  local invariantEither = { imap = Data_Functor_Invariant.imapF(functorEither) }
  local fromRightPrime = function(v_9)
    return function(v1_10)
      if "Data.Either.Right" == v1_10["$ctor"] then
        return (function() local b = v1_10[0] return b end)()
      else
        return (function()
          local default = v_9
          return default(Data_Unit.unit)
        end)()
      end
    end
  end
  local fromRight = function(v_11)
    return function(v1_12)
      if "Data.Either.Right" == v1_12["$ctor"] then
        return (function() local b = v1_12[0] return b end)()
      else
        return (function() local default = v_11 return default end)()
      end
    end
  end
  local fromLeftPrime = function(v_13)
    return function(v1_14)
      if "Data.Either.Left" == v1_14["$ctor"] then
        return (function() local a = v1_14[0] return a end)()
      else
        return (function()
          local default = v_13
          return default(Data_Unit.unit)
        end)()
      end
    end
  end
  local fromLeft = function(v_15)
    return function(v1_16)
      if "Data.Either.Left" == v1_16["$ctor"] then
        return (function() local a = v1_16[0] return a end)()
      else
        return (function() local default = v_15 return default end)()
      end
    end
  end
  local extendEither = {
    extend = function(v_17)
      return function(v1_18)
        if "Data.Either.Left" == v1_18["$ctor"] then
          return (function() local y = v1_18[0] return Left(y) end)()
        else
          return (function()
            local x = v1_18
            local f = v_17
            return Right(f(x))
          end)()
        end
      end
    end,
    Functor0 = function() return functorEither end
  }
  local eqEither = function(dictEq_19)
    local eq = Data_Eq.eq(dictEq_19)
    return function(dictEq1_20)
      return (function()
        local eq1 = Data_Eq.eq(dictEq1_20)
        return {
          eq = function(x_21)
            return function(y_22)
              return (function()
                if "Data.Either.Left" == x_21["$ctor"] then
                  return (function()
                    if "Data.Either.Left" == y_22["$ctor"] then
                      return (function()
                        local l = x_21[0]
                        local r = y_22[0]
                        return (eq(l))(r)
                      end)()
                    else
                      return false
                    end
                  end)()
                else
                  return (function()
                    if "Data.Either.Right" == x_21["$ctor"] then
                      return (function()
                        if "Data.Either.Right" == y_22["$ctor"] then
                          return (function()
                            local r = y_22[0]
                            local l = x_21[0]
                            return (eq1(l))(r)
                          end)()
                        else
                          return false
                        end
                      end)()
                    else
                      return false
                    end
                  end)()
                end
              end)()
            end
          end
        }
      end)()
    end
  end
  local ordEither = function(dictOrd_23)
    local compare = Data_Ord.compare(dictOrd_23)
    local eqEither1 = eqEither(dictOrd_23.Eq0(Prim.undefined))
    return function(dictOrd1_24)
      return (function()
        local compare1 = Data_Ord.compare(dictOrd1_24)
        local eqEither2 = eqEither1(dictOrd1_24.Eq0(Prim.undefined))
        return {
          compare = function(x_25)
            return function(y_26)
              return (function()
                if "Data.Either.Left" == x_25["$ctor"] then
                  return (function()
                    if "Data.Either.Left" == y_26["$ctor"] then
                      return (function()
                        local l = x_25[0]
                        local r = y_26[0]
                        return (compare(l))(r)
                      end)()
                    else
                      return Data_Ordering.LT
                    end
                  end)()
                else
                  return (function()
                    if "Data.Either.Left" == y_26["$ctor"] then
                      return Data_Ordering.GT
                    else
                      return (function()
                        if "Data.Either.Right" == x_25["$ctor"] then
                          return (function()
                            if "Data.Either.Right" == y_26["$ctor"] then
                              return (function()
                                local r = y_26[0]
                                local l = x_25[0]
                                return (compare1(l))(r)
                              end)()
                            else
                              return error("No patterns matched")
                            end
                          end)()
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    end
                  end)()
                end
              end)()
            end
          end,
          Eq0 = function() return eqEither2 end
        }
      end)()
    end
  end
  local eq1Either = function(dictEq_27)
    local eqEither1 = eqEither(dictEq_27)
    return {
      eq1 = function(dictEq1_28) return Data_Eq.eq(eqEither1(dictEq1_28)) end
    }
  end
  local ord1Either = function(dictOrd_29)
    local ordEither1 = ordEither(dictOrd_29)
    local eq1Either1 = eq1Either(dictOrd_29.Eq0(Prim.undefined))
    return {
      compare1 = function(dictOrd1_30)
        return Data_Ord.compare(ordEither1(dictOrd1_30))
      end,
      Eq10 = function() return eq1Either1 end
    }
  end
  local either = function(v_31)
    return function(v1_32)
      return function(v2_33)
        if "Data.Either.Left" == v2_33["$ctor"] then
          return (function()
            local f = v_31
            local a = v2_33[0]
            return f(a)
          end)()
        else
          return (function()
            if "Data.Either.Right" == v2_33["$ctor"] then
              return (function()
                local b = v2_33[0]
                local g = v1_32
                return g(b)
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end
  end
  local hush = (either(Data_Function.const(Data_Maybe.Nothing)))(Data_Maybe.Just)
  local isLeft = (either(Data_Function.const(true)))(Data_Function.const(false))
  local isRight = (either(Data_Function.const(false)))(Data_Function.const(true))
  local choose = function(dictAlt_34)
    local alt = Control_Alt.alt(dictAlt_34)
    local map1 = Data_Functor.map(dictAlt_34.Functor0(Prim.undefined))
    return function(a_35)
      return function(b_36)
        return (alt((map1(Left))(a_35)))((map1(Right))(b_36))
      end
    end
  end
  local boundedEither = function(dictBounded_37)
    local bottom = Data_Bounded.bottom(dictBounded_37)
    local ordEither1 = ordEither(dictBounded_37.Ord0(Prim.undefined))
    return function(dictBounded1_38)
      return (function()
        local ordEither2 = ordEither1(dictBounded1_38.Ord0(Prim.undefined))
        return {
          top = Right(Data_Bounded.top(dictBounded1_38)),
          bottom = Left(bottom),
          Ord0 = function() return ordEither2 end
        }
      end)()
    end
  end
  local blush = (either(Data_Maybe.Just))(Data_Function.const(Data_Maybe.Nothing))
  local applyEither = {
    apply = function(v_39)
      return function(v1_40)
        if "Data.Either.Left" == v_39["$ctor"] then
          return (function() local e = v_39[0] return Left(e) end)()
        else
          return (function()
            if "Data.Either.Right" == v_39["$ctor"] then
              return (function()
                local r = v1_40
                local f = v_39[0]
                return (map(f))(r)
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end,
    Functor0 = function() return functorEither end
  }
  local apply = Control_Apply.apply(applyEither)
  local bindEither = {
    bind = (either(function(e_41)
      return function(v_42) return Left(e_41) end
    end))(function(a_43) return function(f_44) return f_44(a_43) end end),
    Apply0 = function() return applyEither end
  }
  local semigroupEither = function(dictSemigroup_45)
    local append1 = Data_Semigroup.append(dictSemigroup_45)
    return {
      append = function(x_46)
        return function(y_47) return (apply((map(append1))(x_46)))(y_47) end
      end
    }
  end
  local applicativeEither = {
    pure = Right,
    Apply0 = function() return applyEither end
  }
  local monadEither = {
    Applicative0 = function() return applicativeEither end,
    Bind1 = function() return bindEither end
  }
  local altEither = {
    alt = function(v_48)
      return function(v1_49)
        if "Data.Either.Left" == v_48["$ctor"] then
          return (function() local r = v1_49 return r end)()
        else
          return (function() local l = v_48 return l end)()
        end
      end
    end,
    Functor0 = function() return functorEither end
  }
  return {
    Left = Left,
    Right = Right,
    either = either,
    choose = choose,
    isLeft = isLeft,
    isRight = isRight,
    fromLeft = fromLeft,
    fromLeftPrime = fromLeftPrime,
    fromRight = fromRight,
    fromRightPrime = fromRightPrime,
    note = note,
    notePrime = notePrime,
    hush = hush,
    blush = blush,
    functorEither = functorEither,
    genericEither = genericEither,
    invariantEither = invariantEither,
    applyEither = applyEither,
    applicativeEither = applicativeEither,
    altEither = altEither,
    bindEither = bindEither,
    monadEither = monadEither,
    extendEither = extendEither,
    showEither = showEither,
    eqEither = eqEither,
    eq1Either = eq1Either,
    ordEither = ordEither,
    ord1Either = ord1Either,
    boundedEither = boundedEither,
    semigroupEither = semigroupEither
  }
end)()
local Data_Tuple = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local conj = Data_HeytingAlgebra.conj(Data_HeytingAlgebra.heytingAlgebraBoolean)
  local Tuple = function(value0, value1)
    return { ["$ctor"] = "Data_Tuple.Tuple", value0 = value0, value1 = value1 }
  end
  local uncurry = function(f_0)
    return function(v_1)
      if "Data.Tuple.Tuple" == v_1["$ctor"] then
        return (function()
          local b = v_1[1]
          local a = v_1[0]
          local f1 = f_0
          return (f1(a))(b)
        end)()
      else
        return error("No patterns matched")
      end
    end
  end
  local swap = function(v_2)
    if "Data.Tuple.Tuple" == v_2["$ctor"] then
      return (function()
        local b = v_2[1]
        local a = v_2[0]
        return (Tuple(b))(a)
      end)()
    else
      return error("No patterns matched")
    end
  end
  local snd = function(v_3)
    if "Data.Tuple.Tuple" == v_3["$ctor"] then
      return (function() local b = v_3[1] return b end)()
    else
      return error("No patterns matched")
    end
  end
  local showTuple = function(dictShow_4)
    local show = Data_Show.show(dictShow_4)
    return function(dictShow1_5)
      return (function()
        local show1 = Data_Show.show(dictShow1_5)
        return {
          show = function(v_6)
            return (function()
              if "Data.Tuple.Tuple" == v_6["$ctor"] then
                return (function()
                  local b = v_6[1]
                  local a = v_6[0]
                  return (append("(Tuple "))((append(show(a)))((append(" "))((append(show1(b)))(")"))))
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        }
      end)()
    end
  end
  local semiringTuple = function(dictSemiring_7)
    local add = Data_Semiring.add(dictSemiring_7)
    local one = Data_Semiring.one(dictSemiring_7)
    local mul = Data_Semiring.mul(dictSemiring_7)
    local zero = Data_Semiring.zero(dictSemiring_7)
    return function(dictSemiring1_8)
      return (function()
        local add1 = Data_Semiring.add(dictSemiring1_8)
        local mul1 = Data_Semiring.mul(dictSemiring1_8)
        return {
          add = function(v_9)
            return function(v1_10)
              return (function()
                if "Data.Tuple.Tuple" == v_9["$ctor"] then
                  return (function()
                    if "Data.Tuple.Tuple" == v1_10["$ctor"] then
                      return (function()
                        local y2 = v1_10[1]
                        local x2 = v1_10[0]
                        local y1 = v_9[1]
                        local x1 = v_9[0]
                        return (Tuple((add(x1))(x2)))((add1(y1))(y2))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end,
          one = (Tuple(one))(Data_Semiring.one(dictSemiring1_8)),
          mul = function(v_11)
            return function(v1_12)
              return (function()
                if "Data.Tuple.Tuple" == v_11["$ctor"] then
                  return (function()
                    if "Data.Tuple.Tuple" == v1_12["$ctor"] then
                      return (function()
                        local y2 = v1_12[1]
                        local x2 = v1_12[0]
                        local y1 = v_11[1]
                        local x1 = v_11[0]
                        return (Tuple((mul(x1))(x2)))((mul1(y1))(y2))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end,
          zero = (Tuple(zero))(Data_Semiring.zero(dictSemiring1_8))
        }
      end)()
    end
  end
  local semigroupoidTuple = {
    compose = function(v_13)
      return function(v1_14)
        if "Data.Tuple.Tuple" == v_13["$ctor"] then
          return (function()
            if "Data.Tuple.Tuple" == v1_14["$ctor"] then
              return (function()
                local a = v1_14[0]
                local c = v_13[1]
                return (Tuple(a))(c)
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        else
          return error("No patterns matched")
        end
      end
    end
  }
  local semigroupTuple = function(dictSemigroup_15)
    local append1 = Data_Semigroup.append(dictSemigroup_15)
    return function(dictSemigroup1_16)
      return (function()
        local append2 = Data_Semigroup.append(dictSemigroup1_16)
        return {
          append = function(v_17)
            return function(v1_18)
              return (function()
                if "Data.Tuple.Tuple" == v_17["$ctor"] then
                  return (function()
                    if "Data.Tuple.Tuple" == v1_18["$ctor"] then
                      return (function()
                        local b2 = v1_18[1]
                        local a2 = v1_18[0]
                        local b1 = v_17[1]
                        local a1 = v_17[0]
                        return (Tuple((append1(a1))(a2)))((append2(b1))(b2))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end
        }
      end)()
    end
  end
  local ringTuple = function(dictRing_19)
    local sub = Data_Ring.sub(dictRing_19)
    local semiringTuple1 = semiringTuple(dictRing_19.Semiring0(Prim.undefined))
    return function(dictRing1_20)
      return (function()
        local sub1 = Data_Ring.sub(dictRing1_20)
        local semiringTuple2 = semiringTuple1(dictRing1_20.Semiring0(Prim.undefined))
        return {
          sub = function(v_21)
            return function(v1_22)
              return (function()
                if "Data.Tuple.Tuple" == v_21["$ctor"] then
                  return (function()
                    if "Data.Tuple.Tuple" == v1_22["$ctor"] then
                      return (function()
                        local y2 = v1_22[1]
                        local x2 = v1_22[0]
                        local y1 = v_21[1]
                        local x1 = v_21[0]
                        return (Tuple((sub(x1))(x2)))((sub1(y1))(y2))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end,
          Semiring0 = function() return semiringTuple2 end
        }
      end)()
    end
  end
  local monoidTuple = function(dictMonoid_23)
    local mempty = Data_Monoid.mempty(dictMonoid_23)
    local semigroupTuple1 = semigroupTuple(dictMonoid_23.Semigroup0(Prim.undefined))
    return function(dictMonoid1_24)
      return (function()
        local semigroupTuple2 = semigroupTuple1(dictMonoid1_24.Semigroup0(Prim.undefined))
        return {
          mempty = (Tuple(mempty))(Data_Monoid.mempty(dictMonoid1_24)),
          Semigroup0 = function() return semigroupTuple2 end
        }
      end)()
    end
  end
  local heytingAlgebraTuple = function(dictHeytingAlgebra_25)
    local tt = Data_HeytingAlgebra.tt(dictHeytingAlgebra_25)
    local ff = Data_HeytingAlgebra.ff(dictHeytingAlgebra_25)
    local implies = Data_HeytingAlgebra.implies(dictHeytingAlgebra_25)
    local conj1 = Data_HeytingAlgebra.conj(dictHeytingAlgebra_25)
    local disj = Data_HeytingAlgebra.disj(dictHeytingAlgebra_25)
    local _not_ = Data_HeytingAlgebra._not_(dictHeytingAlgebra_25)
    return function(dictHeytingAlgebra1_26)
      return (function()
        local implies1 = Data_HeytingAlgebra.implies(dictHeytingAlgebra1_26)
        local conj2 = Data_HeytingAlgebra.conj(dictHeytingAlgebra1_26)
        local disj1 = Data_HeytingAlgebra.disj(dictHeytingAlgebra1_26)
        local not1 = Data_HeytingAlgebra._not_(dictHeytingAlgebra1_26)
        return {
          tt = (Tuple(tt))(Data_HeytingAlgebra.tt(dictHeytingAlgebra1_26)),
          ff = (Tuple(ff))(Data_HeytingAlgebra.ff(dictHeytingAlgebra1_26)),
          implies = function(v_27)
            return function(v1_28)
              return (function()
                if "Data.Tuple.Tuple" == v_27["$ctor"] then
                  return (function()
                    if "Data.Tuple.Tuple" == v1_28["$ctor"] then
                      return (function()
                        local y2 = v1_28[1]
                        local x2 = v1_28[0]
                        local y1 = v_27[1]
                        local x1 = v_27[0]
                        return (Tuple((implies(x1))(x2)))((implies1(y1))(y2))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end,
          conj = function(v_29)
            return function(v1_30)
              return (function()
                if "Data.Tuple.Tuple" == v_29["$ctor"] then
                  return (function()
                    if "Data.Tuple.Tuple" == v1_30["$ctor"] then
                      return (function()
                        local y2 = v1_30[1]
                        local x2 = v1_30[0]
                        local y1 = v_29[1]
                        local x1 = v_29[0]
                        return (Tuple((conj1(x1))(x2)))((conj2(y1))(y2))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end,
          disj = function(v_31)
            return function(v1_32)
              return (function()
                if "Data.Tuple.Tuple" == v_31["$ctor"] then
                  return (function()
                    if "Data.Tuple.Tuple" == v1_32["$ctor"] then
                      return (function()
                        local y2 = v1_32[1]
                        local x2 = v1_32[0]
                        local y1 = v_31[1]
                        local x1 = v_31[0]
                        return (Tuple((disj(x1))(x2)))((disj1(y1))(y2))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end,
          _not_ = function(v_33)
            return (function()
              if "Data.Tuple.Tuple" == v_33["$ctor"] then
                return (function()
                  local y = v_33[1]
                  local x = v_33[0]
                  return (Tuple(_not_(x)))(not1(y))
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        }
      end)()
    end
  end
  local genericTuple = {
    to = function(x_34)
      if "Data.Generic.Rep.Product" == x_34["$ctor"] then
        return (function()
          local arg1 = x_34[1]
          local arg = x_34[0]
          return (Tuple(arg))(arg1)
        end)()
      else
        return error("No patterns matched")
      end
    end,
    from = function(x_35)
      if "Data.Tuple.Tuple" == x_35["$ctor"] then
        return (function()
          local arg1 = x_35[1]
          local arg = x_35[0]
          return (Data_Generic_Rep.Product(arg))(arg1)
        end)()
      else
        return error("No patterns matched")
      end
    end
  }
  local functorTuple = {
    map = function(f_36)
      return function(m_37)
        if "Data.Tuple.Tuple" == m_37["$ctor"] then
          return (function()
            local v1 = m_37[1]
            local v = m_37[0]
            return (Tuple(v))(f_36(v1))
          end)()
        else
          return error("No patterns matched")
        end
      end
    end
  }
  local invariantTuple = { imap = Data_Functor_Invariant.imapF(functorTuple) }
  local fst = function(v_38)
    if "Data.Tuple.Tuple" == v_38["$ctor"] then
      return (function() local a = v_38[0] return a end)()
    else
      return error("No patterns matched")
    end
  end
  local lazyTuple = function(dictLazy_39)
    local defer = Control_Lazy.defer(dictLazy_39)
    return function(dictLazy1_40)
      return (function()
        local defer1 = Control_Lazy.defer(dictLazy1_40)
        return {
          defer = function(f_41)
            return (Tuple(defer(function(v_42)
              return fst(f_41(Data_Unit.unit))
            end)))(defer1(function(v_43) return snd(f_41(Data_Unit.unit)) end))
          end
        }
      end)()
    end
  end
  local extendTuple = {
    extend = function(f_44)
      return function(v_45)
        if "Data.Tuple.Tuple" == v_45["$ctor"] then
          return (function()
            local a = v_45[0]
            local t = v_45
            local f1 = f_44
            return (Tuple(a))(f1(t))
          end)()
        else
          return error("No patterns matched")
        end
      end
    end,
    Functor0 = function() return functorTuple end
  }
  local eqTuple = function(dictEq_46)
    local eq = Data_Eq.eq(dictEq_46)
    return function(dictEq1_47)
      return (function()
        local eq1 = Data_Eq.eq(dictEq1_47)
        return {
          eq = function(x_48)
            return function(y_49)
              return (function()
                if "Data.Tuple.Tuple" == x_48["$ctor"] then
                  return (function()
                    if "Data.Tuple.Tuple" == y_49["$ctor"] then
                      return (function()
                        local r1 = y_49[1]
                        local r = y_49[0]
                        local l1 = x_48[1]
                        local l = x_48[0]
                        return (conj((eq(l))(r)))((eq1(l1))(r1))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end
        }
      end)()
    end
  end
  local ordTuple = function(dictOrd_50)
    local compare = Data_Ord.compare(dictOrd_50)
    local eqTuple1 = eqTuple(dictOrd_50.Eq0(Prim.undefined))
    return function(dictOrd1_51)
      return (function()
        local compare1 = Data_Ord.compare(dictOrd1_51)
        local eqTuple2 = eqTuple1(dictOrd1_51.Eq0(Prim.undefined))
        return {
          compare = function(x_52)
            return function(y_53)
              return (function()
                if "Data.Tuple.Tuple" == x_52["$ctor"] then
                  return (function()
                    if "Data.Tuple.Tuple" == y_53["$ctor"] then
                      return (function()
                        local r1 = y_53[1]
                        local r = y_53[0]
                        local l1 = x_52[1]
                        local l = x_52[0]
                        return (function()
                          local v = (compare(l))(r)
                          return (function()
                            if "Data.Ordering.LT" == v["$ctor"] then
                              return Data_Ordering.LT
                            else
                              return (function()
                                if "Data.Ordering.GT" == v["$ctor"] then
                                  return Data_Ordering.GT
                                else
                                  return (compare1(l1))(r1)
                                end
                              end)()
                            end
                          end)()
                        end)()
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end,
          Eq0 = function() return eqTuple2 end
        }
      end)()
    end
  end
  local eq1Tuple = function(dictEq_54)
    local eqTuple1 = eqTuple(dictEq_54)
    return {
      eq1 = function(dictEq1_55) return Data_Eq.eq(eqTuple1(dictEq1_55)) end
    }
  end
  local ord1Tuple = function(dictOrd_56)
    local ordTuple1 = ordTuple(dictOrd_56)
    local eq1Tuple1 = eq1Tuple(dictOrd_56.Eq0(Prim.undefined))
    return {
      compare1 = function(dictOrd1_57)
        return Data_Ord.compare(ordTuple1(dictOrd1_57))
      end,
      Eq10 = function() return eq1Tuple1 end
    }
  end
  local curry = function(f_58)
    return function(a_59)
      return function(b_60) return f_58((Tuple(a_59))(b_60)) end
    end
  end
  local comonadTuple = {
    extract = snd,
    Extend0 = function() return extendTuple end
  }
  local commutativeRingTuple = function(dictCommutativeRing_61)
    local ringTuple1 = ringTuple(dictCommutativeRing_61.Ring0(Prim.undefined))
    return function(dictCommutativeRing1_62)
      return (function()
        local ringTuple2 = ringTuple1(dictCommutativeRing1_62.Ring0(Prim.undefined))
        return { Ring0 = function() return ringTuple2 end }
      end)()
    end
  end
  local boundedTuple = function(dictBounded_63)
    local top = Data_Bounded.top(dictBounded_63)
    local bottom = Data_Bounded.bottom(dictBounded_63)
    local ordTuple1 = ordTuple(dictBounded_63.Ord0(Prim.undefined))
    return function(dictBounded1_64)
      return (function()
        local ordTuple2 = ordTuple1(dictBounded1_64.Ord0(Prim.undefined))
        return {
          top = (Tuple(top))(Data_Bounded.top(dictBounded1_64)),
          bottom = (Tuple(bottom))(Data_Bounded.bottom(dictBounded1_64)),
          Ord0 = function() return ordTuple2 end
        }
      end)()
    end
  end
  local booleanAlgebraTuple = function(dictBooleanAlgebra_65)
    local heytingAlgebraTuple1 = heytingAlgebraTuple(dictBooleanAlgebra_65.HeytingAlgebra0(Prim.undefined))
    return function(dictBooleanAlgebra1_66)
      return (function()
        local heytingAlgebraTuple2 = heytingAlgebraTuple1(dictBooleanAlgebra1_66.HeytingAlgebra0(Prim.undefined))
        return { HeytingAlgebra0 = function() return heytingAlgebraTuple2 end }
      end)()
    end
  end
  local applyTuple = function(dictSemigroup_67)
    local append1 = Data_Semigroup.append(dictSemigroup_67)
    return {
      apply = function(v_68)
        return function(v1_69)
          return (function()
            if "Data.Tuple.Tuple" == v_68["$ctor"] then
              return (function()
                if "Data.Tuple.Tuple" == v1_69["$ctor"] then
                  return (function()
                    local x = v1_69[1]
                    local a2 = v1_69[0]
                    local f = v_68[1]
                    local a1 = v_68[0]
                    return (Tuple((append1(a1))(a2)))(f(x))
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end,
      Functor0 = function() return functorTuple end
    }
  end
  local bindTuple = function(dictSemigroup_70)
    local append1 = Data_Semigroup.append(dictSemigroup_70)
    local applyTuple1 = applyTuple(dictSemigroup_70)
    return {
      bind = function(v_71)
        return function(f_72)
          return (function()
            if "Data.Tuple.Tuple" == v_71["$ctor"] then
              return (function()
                local f1 = f_72
                local b = v_71[1]
                local a1 = v_71[0]
                return (function()
                  local v1 = f1(b)
                  return (function()
                    if "Data.Tuple.Tuple" == v1["$ctor"] then
                      return (function()
                        local c = v1[1]
                        local a2 = v1[0]
                        return (Tuple((append1(a1))(a2)))(c)
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end)()
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end,
      Apply0 = function() return applyTuple1 end
    }
  end
  local applicativeTuple = function(dictMonoid_73)
    local applyTuple1 = applyTuple(dictMonoid_73.Semigroup0(Prim.undefined))
    return {
      pure = Tuple(Data_Monoid.mempty(dictMonoid_73)),
      Apply0 = function() return applyTuple1 end
    }
  end
  local monadTuple = function(dictMonoid_74)
    local applicativeTuple1 = applicativeTuple(dictMonoid_74)
    local bindTuple1 = bindTuple(dictMonoid_74.Semigroup0(Prim.undefined))
    return {
      Applicative0 = function() return applicativeTuple1 end,
      Bind1 = function() return bindTuple1 end
    }
  end
  return {
    Tuple = Tuple,
    fst = fst,
    snd = snd,
    curry = curry,
    uncurry = uncurry,
    swap = swap,
    showTuple = showTuple,
    eqTuple = eqTuple,
    eq1Tuple = eq1Tuple,
    ordTuple = ordTuple,
    ord1Tuple = ord1Tuple,
    boundedTuple = boundedTuple,
    semigroupoidTuple = semigroupoidTuple,
    semigroupTuple = semigroupTuple,
    monoidTuple = monoidTuple,
    semiringTuple = semiringTuple,
    ringTuple = ringTuple,
    commutativeRingTuple = commutativeRingTuple,
    heytingAlgebraTuple = heytingAlgebraTuple,
    booleanAlgebraTuple = booleanAlgebraTuple,
    functorTuple = functorTuple,
    genericTuple = genericTuple,
    invariantTuple = invariantTuple,
    applyTuple = applyTuple,
    applicativeTuple = applicativeTuple,
    bindTuple = bindTuple,
    monadTuple = monadTuple,
    extendTuple = extendTuple,
    comonadTuple = comonadTuple,
    lazyTuple = lazyTuple
  }
end)()
local Data_Bifunctor = (function()
  local identity = Control_Category.identity(Control_Category.categoryFn)
  local Bifunctor_S_Dict = function(x_0) return x_0 end
  local bimap = function(dict_1) local v = dict_1 return v.bimap end
  local lmap = function(dictBifunctor_2)
    local bimap1 = bimap(dictBifunctor_2)
    return function(f_3) return (bimap1(f_3))(identity) end
  end
  local rmap = function(dictBifunctor_4)
    return (bimap(dictBifunctor_4))(identity)
  end
  local bifunctorTuple = {
    bimap = function(f_5)
      return function(g_6)
        return function(v_7)
          if "Data.Tuple.Tuple" == v_7["$ctor"] then
            return (function()
              local y = v_7[1]
              local x = v_7[0]
              local g1 = g_6
              local f1 = f_5
              return (Data_Tuple.Tuple(f1(x)))(g1(y))
            end)()
          else
            return error("No patterns matched")
          end
        end
      end
    end
  }
  local bifunctorEither = {
    bimap = function(v_8)
      return function(v1_9)
        return function(v2_10)
          if "Data.Either.Left" == v2_10["$ctor"] then
            return (function()
              local f = v_8
              local l = v2_10[0]
              return Data_Either.Left(f(l))
            end)()
          else
            return (function()
              if "Data.Either.Right" == v2_10["$ctor"] then
                return (function()
                  local r = v2_10[0]
                  local g = v1_9
                  return Data_Either.Right(g(r))
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end
      end
    end
  }
  local bifunctorConst = {
    bimap = function(f_11)
      return function(v_12)
        return function(v1_13) local a = v1_13 local f1 = f_11 return f1(a) end
      end
    end
  }
  return {
    bimap = bimap,
    lmap = lmap,
    rmap = rmap,
    bifunctorEither = bifunctorEither,
    bifunctorTuple = bifunctorTuple,
    bifunctorConst = bifunctorConst
  }
end)()
local Data_Identity = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Identity = function(x_0) return x_0 end
  local showIdentity = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local x = v_2
          return (append("(Identity "))((append(show(x)))(")"))
        end)()
      end
    }
  end
  local semiringIdentity = function(dictSemiring_3) return dictSemiring_3 end
  local semigroupIdentity = function(dictSemigroup_4) return dictSemigroup_4 end
  local ringIdentity = function(dictRing_5) return dictRing_5 end
  local ordIdentity = function(dictOrd_6) return dictOrd_6 end
  local newtypeIdentity = { Coercible0 = function() return Prim.undefined end }
  local monoidIdentity = function(dictMonoid_7) return dictMonoid_7 end
  local lazyIdentity = function(dictLazy_8) return dictLazy_8 end
  local heytingAlgebraIdentity = function(dictHeytingAlgebra_9)
    return dictHeytingAlgebra_9
  end
  local functorIdentity = {
    map = function(f_10)
      return function(m_11) local v = m_11 return f_10(v) end
    end
  }
  local invariantIdentity = {
    imap = Data_Functor_Invariant.imapF(functorIdentity)
  }
  local extendIdentity = {
    extend = function(f_12) return function(m_13) return f_12(m_13) end end,
    Functor0 = function() return functorIdentity end
  }
  local euclideanRingIdentity = function(dictEuclideanRing_14)
    return dictEuclideanRing_14
  end
  local eqIdentity = function(dictEq_15) return dictEq_15 end
  local eq1Identity = {
    eq1 = function(dictEq_16) return Data_Eq.eq(eqIdentity(dictEq_16)) end
  }
  local ord1Identity = {
    compare1 = function(dictOrd_17)
      return Data_Ord.compare(ordIdentity(dictOrd_17))
    end,
    Eq10 = function() return eq1Identity end
  }
  local comonadIdentity = {
    extract = function(v_18) local x = v_18 return x end,
    Extend0 = function() return extendIdentity end
  }
  local commutativeRingIdentity = function(dictCommutativeRing_19)
    return dictCommutativeRing_19
  end
  local boundedIdentity = function(dictBounded_20) return dictBounded_20 end
  local booleanAlgebraIdentity = function(dictBooleanAlgebra_21)
    return dictBooleanAlgebra_21
  end
  local applyIdentity = {
    apply = function(v_22)
      return function(v1_23) local x = v1_23 local f = v_22 return f(x) end
    end,
    Functor0 = function() return functorIdentity end
  }
  local bindIdentity = {
    bind = function(v_24)
      return function(f_25) local f1 = f_25 local m = v_24 return f1(m) end
    end,
    Apply0 = function() return applyIdentity end
  }
  local applicativeIdentity = {
    pure = Identity,
    Apply0 = function() return applyIdentity end
  }
  local monadIdentity = {
    Applicative0 = function() return applicativeIdentity end,
    Bind1 = function() return bindIdentity end
  }
  local altIdentity = {
    alt = function(x_26) return function(v_27) return x_26 end end,
    Functor0 = function() return functorIdentity end
  }
  return {
    Identity = Identity,
    newtypeIdentity = newtypeIdentity,
    eqIdentity = eqIdentity,
    ordIdentity = ordIdentity,
    boundedIdentity = boundedIdentity,
    heytingAlgebraIdentity = heytingAlgebraIdentity,
    booleanAlgebraIdentity = booleanAlgebraIdentity,
    semigroupIdentity = semigroupIdentity,
    monoidIdentity = monoidIdentity,
    semiringIdentity = semiringIdentity,
    euclideanRingIdentity = euclideanRingIdentity,
    ringIdentity = ringIdentity,
    commutativeRingIdentity = commutativeRingIdentity,
    lazyIdentity = lazyIdentity,
    showIdentity = showIdentity,
    eq1Identity = eq1Identity,
    ord1Identity = ord1Identity,
    functorIdentity = functorIdentity,
    invariantIdentity = invariantIdentity,
    altIdentity = altIdentity,
    applyIdentity = applyIdentity,
    applicativeIdentity = applicativeIdentity,
    bindIdentity = bindIdentity,
    monadIdentity = monadIdentity,
    extendIdentity = extendIdentity,
    comonadIdentity = comonadIdentity
  }
end)()
local Effect = (function()
  local foreign = (function()
    return {

      pureE = function(a)
        return function()
          return a
        end
      end

      , bindE = function(a)
        return function(f)
          return function()
            return f(a())()
          end
        end
      end

      , untilE = function(f)
        return function()
          while not f() do end
        end
      end

      , whileE = function(f)
        return function(a)
          return function()
            while f() do
              a()
            end
          end
        end
      end

      , forE = function(lo)
        return function(hi)
          return function(f)
            return function()
              for i = lo, hi do
                f(i)()
              end
            end
          end
        end
      end

      , foreachE = function(as)
        return function(f)
          return function()
            for i, v in ipairs(as) do
              f(v)()
            end
          end
        end
      end

    }

  end)()
  local pureE = foreign.pureE
  local bindE = foreign.bindE
  local untilE = foreign.untilE
  local whileE = foreign.whileE
  local forE = foreign.forE
  local foreachE = foreign.foreachE
  local monadEffect, bindEffect, applicativeEffect, _S___lazy_functorEffect, _S___lazy_applyEffect, functorEffect, applyEffect
  monadEffect = {
    Applicative0 = function() return applicativeEffect end,
    Bind1 = function() return bindEffect end
  }
  bindEffect = {
    bind = bindE,
    Apply0 = function() return _S___lazy_applyEffect(0) end
  }
  applicativeEffect = {
    pure = pureE,
    Apply0 = function() return _S___lazy_applyEffect(0) end
  }
  _S___lazy_functorEffect = (_S___runtime_lazy("functorEffect"))(function()
    return { map = Control_Applicative.liftA1(applicativeEffect) }
  end)
  _S___lazy_applyEffect = (_S___runtime_lazy("applyEffect"))(function()
    return {
      apply = Control_Monad.ap(monadEffect),
      Functor0 = function() return _S___lazy_functorEffect(0) end
    }
  end)
  functorEffect = _S___lazy_functorEffect(0)
  applyEffect = _S___lazy_applyEffect(0)
  local lift2 = Control_Apply.lift2(applyEffect)
  local semigroupEffect = function(dictSemigroup_0)
    return { append = lift2(Data_Semigroup.append(dictSemigroup_0)) }
  end
  local monoidEffect = function(dictMonoid_1)
    local semigroupEffect1 = semigroupEffect(dictMonoid_1.Semigroup0(Prim.undefined))
    return {
      mempty = pureE(Data_Monoid.mempty(dictMonoid_1)),
      Semigroup0 = function() return semigroupEffect1 end
    }
  end
  return {
    untilE = untilE,
    whileE = whileE,
    forE = forE,
    foreachE = foreachE,
    functorEffect = functorEffect,
    applyEffect = applyEffect,
    applicativeEffect = applicativeEffect,
    bindEffect = bindEffect,
    monadEffect = monadEffect,
    semigroupEffect = semigroupEffect,
    monoidEffect = monoidEffect
  }
end)()
local Effect_Ref = (function()
  local foreign = (function()
    return {
        _new = function(val) return function() return { value = val }; end; end,
        newWithSelf = function(f)
            return function()
                local ref = { value = nil };
                ref.value = f(ref);
                return ref;
            end;
        end,
        modifyImpl = function(f)
            return function(ref)
                return function()
                    local t = f(ref.value);
                    ref.value = t.state;
                    return t.value;
                end;
            end;
        end,
        read = function(ref) return function() return ref.value; end; end,
        write = function(val)
            return function(ref) return function() ref.value = val; end; end;
        end,
    }

  end)()
  local _new = foreign._new
  local newWithSelf = foreign.newWithSelf
  local read = foreign.read
  local modifyImpl = foreign.modifyImpl
  local write = foreign.write
  local void = Data_Functor.void(Effect.functorEffect)
  local new = _new
  local modifyPrime = modifyImpl
  local modify = function(f_0)
    return modifyPrime(function(s_1)
      local sPrime = f_0(s_1)
      return { state = sPrime, value = sPrime }
    end)
  end
  local modify_ = function(f_2)
    return function(s_3) return void((modify(f_2))(s_3)) end
  end
  return {
    new = new,
    newWithSelf = newWithSelf,
    read = read,
    modifyPrime = modifyPrime,
    modify = modify,
    modify_ = modify_,
    write = write
  }
end)()
local Partial = (function()
  local foreign = (function()
    return { _crashWith = function(msg) error(msg) end }

  end)()
  local _crashWith = foreign._crashWith
  local crashWith = function() return _crashWith end
  local crashWith1 = crashWith(Prim.undefined)
  local crash = function()
    return crashWith1("Partial.crash: partial function")
  end
  return { crash = crash, crashWith = crashWith }
end)()
local Partial_Unsafe = (function()
  local foreign = (function()
    return { _unsafePartial = function(f) return f(); end }

  end)()
  local _unsafePartial = foreign._unsafePartial
  local crashWith = Partial.crashWith(Prim.undefined)
  local unsafePartial = _unsafePartial
  local unsafeCrashWith = function(msg_0)
    return unsafePartial(function() return crashWith(msg_0) end)
  end
  return { unsafePartial = unsafePartial, unsafeCrashWith = unsafeCrashWith }
end)()
local Control_Monad_Rec_Class = (function()
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local bind = Control_Bind.bind(Effect.bindEffect)
  local bindFlipped = Control_Bind.bindFlipped(Effect.bindEffect)
  local discard = (Control_Bind.discard(Control_Bind.discardUnit))(Effect.bindEffect)
  local pure = Control_Applicative.pure(Effect.applicativeEffect)
  local map = Data_Functor.map(Effect.functorEffect)
  local Loop = function(value0)
    return { ["$ctor"] = "Control_Monad_Rec_Class.Loop", value0 = value0 }
  end
  local Done = function(value0)
    return { ["$ctor"] = "Control_Monad_Rec_Class.Done", value0 = value0 }
  end
  local MonadRec_S_Dict = function(x_0) return x_0 end
  local tailRecM = function(dict_1) local v = dict_1 return v.tailRecM end
  local tailRecM2 = function(dictMonadRec_2)
    local tailRecM1 = tailRecM(dictMonadRec_2)
    return function(f_3)
      return function(a_4)
        return function(b_5)
          return (tailRecM1(function(o_6) return (f_3(o_6.a))(o_6.b) end))({
            a = a_4,
            b = b_5
          })
        end
      end
    end
  end
  local tailRecM3 = function(dictMonadRec_7)
    local tailRecM1 = tailRecM(dictMonadRec_7)
    return function(f_8)
      return function(a_9)
        return function(b_10)
          return function(c_11)
            return (tailRecM1(function(o_12)
              return ((f_8(o_12.a))(o_12.b))(o_12.c)
            end))({ a = a_9, b = b_10, c = c_11 })
          end
        end
      end
    end
  end
  local untilJust = function(dictMonadRec_13)
    local tailRecM1 = tailRecM(dictMonadRec_13)
    local mapFlipped = Data_Functor.mapFlipped(dictMonadRec_13.Monad0(Prim.undefined).Bind1(Prim.undefined).Apply0(Prim.undefined).Functor0(Prim.undefined))
    return function(m_14)
      return (tailRecM1(function(v_15)
        return (mapFlipped(m_14))(function(v1_16)
          return (function()
            if "Data.Maybe.Nothing" == v1_16["$ctor"] then
              return Loop(Data_Unit.unit)
            else
              return (function()
                if "Data.Maybe.Just" == v1_16["$ctor"] then
                  return (function() local x = v1_16[0] return Done(x) end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end)
      end))(Data_Unit.unit)
    end
  end
  local whileJust = function(dictMonoid_17)
    local append = Data_Semigroup.append(dictMonoid_17.Semigroup0(Prim.undefined))
    local mempty = Data_Monoid.mempty(dictMonoid_17)
    return function(dictMonadRec_18)
      return (function()
        local tailRecM1 = tailRecM(dictMonadRec_18)
        local mapFlipped = Data_Functor.mapFlipped(dictMonadRec_18.Monad0(Prim.undefined).Bind1(Prim.undefined).Apply0(Prim.undefined).Functor0(Prim.undefined))
        return function(m_19)
          return (tailRecM1(function(v_20)
            return (mapFlipped(m_19))(function(v1_21)
              return (function()
                if "Data.Maybe.Nothing" == v1_21["$ctor"] then
                  return Done(v_20)
                else
                  return (function()
                    if "Data.Maybe.Just" == v1_21["$ctor"] then
                      return (function()
                        local x = v1_21[0]
                        return Loop((append(v_20))(x))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end)()
            end)
          end))(mempty)
        end
      end)()
    end
  end
  local tailRec = function(f_22)
    local go
    go = function(v_23)
      return (function()
        if "Control.Monad.Rec.Class.Loop" == v_23["$ctor"] then
          return (function() local a = v_23[0] return go(f_22(a)) end)()
        else
          return (function()
            if "Control.Monad.Rec.Class.Done" == v_23["$ctor"] then
              return (function() local b = v_23[0] return b end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end)()
    end
    return (compose(go))(f_22)
  end
  local tailRec2 = function(f_24)
    return function(a_25)
      return function(b_26)
        return (tailRec(function(o_27) return (f_24(o_27.a))(o_27.b) end))({
          a = a_25,
          b = b_26
        })
      end
    end
  end
  local tailRec3 = function(f_28)
    return function(a_29)
      return function(b_30)
        return function(c_31)
          return (tailRec(function(o_32)
            return ((f_28(o_32.a))(o_32.b))(o_32.c)
          end))({ a = a_29, b = b_30, c = c_31 })
        end
      end
    end
  end
  local monadRecMaybe = {
    tailRecM = function(f_33)
      return function(a0_34)
        local g = function(v_35)
          return (function()
            if "Data.Maybe.Nothing" == v_35["$ctor"] then
              return Done(Data_Maybe.Nothing)
            else
              return (function()
                if "Data.Maybe.Just" == v_35["$ctor"] then
                  return (function()
                    if "Control.Monad.Rec.Class.Loop" == v_35[0]["$ctor"] then
                      return (function()
                        local a = v_35[0][0]
                        return Loop(f_33(a))
                      end)()
                    else
                      return (function()
                        if "Control.Monad.Rec.Class.Done" == v_35[0]["$ctor"] then
                          return (function()
                            local b = v_35[0][0]
                            return Done(Data_Maybe.Just(b))
                          end)()
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end
        return (tailRec(g))(f_33(a0_34))
      end
    end,
    Monad0 = function() return Data_Maybe.monadMaybe end
  }
  local monadRecIdentity = {
    tailRecM = function(f_36)
      local runIdentity = function(v_37)
        return (function() local x = v_37 return x end)()
      end
      return (compose(Data_Identity.Identity))(tailRec((compose(runIdentity))(f_36)))
    end,
    Monad0 = function() return Data_Identity.monadIdentity end
  }
  local monadRecFunction = {
    tailRecM = function(f_38)
      return function(a0_39)
        return function(e_40)
          return (tailRec(function(a_41) return (f_38(a_41))(e_40) end))(a0_39)
        end
      end
    end,
    Monad0 = function() return Control_Monad.monadFn end
  }
  local monadRecEither = {
    tailRecM = function(f_42)
      return function(a0_43)
        local g = function(v_44)
          return (function()
            if "Data.Either.Left" == v_44["$ctor"] then
              return (function()
                local e = v_44[0]
                return Done(Data_Either.Left(e))
              end)()
            else
              return (function()
                if "Data.Either.Right" == v_44["$ctor"] then
                  return (function()
                    if "Control.Monad.Rec.Class.Loop" == v_44[0]["$ctor"] then
                      return (function()
                        local a = v_44[0][0]
                        return Loop(f_42(a))
                      end)()
                    else
                      return (function()
                        if "Control.Monad.Rec.Class.Done" == v_44[0]["$ctor"] then
                          return (function()
                            local b = v_44[0][0]
                            return Done(Data_Either.Right(b))
                          end)()
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end
        return (tailRec(g))(f_42(a0_43))
      end
    end,
    Monad0 = function() return Data_Either.monadEither end
  }
  local monadRecEffect = {
    tailRecM = function(f_45)
      return function(a_46)
        local fromDone = Partial_Unsafe.unsafePartial(function()
          return function(v_50)
            return (function()
              return (function()
                if "Control.Monad.Rec.Class.Done" == v_50["$ctor"] then
                  return (function() local b = v_50[0] return b end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end)(Prim.undefined)
          end
        end)
        return (bind((bindFlipped(Effect_Ref.new))(f_45(a_46))))(function(r_47)
          return (discard(Effect.untilE((bind(Effect_Ref.read(r_47)))(function( v_48 )
            return (function()
              if "Control.Monad.Rec.Class.Loop" == v_48["$ctor"] then
                return (function()
                  local aPrime = v_48[0]
                  return (bind(f_45(aPrime)))(function(e_49)
                    return (bind((Effect_Ref.write(e_49))(r_47)))(function()
                      return pure(false)
                    end)
                  end)
                end)()
              else
                return (function()
                  if "Control.Monad.Rec.Class.Done" == v_48["$ctor"] then
                    return pure(true)
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end)()
          end))))(function() return (map(fromDone))(Effect_Ref.read(r_47)) end)
        end)
      end
    end,
    Monad0 = function() return Effect.monadEffect end
  }
  local loop3 = function(a_51)
    return function(b_52)
      return function(c_53) return Loop({ a = a_51, b = b_52, c = c_53 }) end
    end
  end
  local loop2 = function(a_54)
    return function(b_55) return Loop({ a = a_54, b = b_55 }) end
  end
  local functorStep = {
    map = function(f_56)
      return function(m_57)
        if "Control.Monad.Rec.Class.Loop" == m_57["$ctor"] then
          return (function() local v = m_57[0] return Loop(v) end)()
        else
          return (function()
            if "Control.Monad.Rec.Class.Done" == m_57["$ctor"] then
              return (function() local v = m_57[0] return Done(f_56(v)) end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end
  }
  local forever = function(dictMonadRec_58)
    local tailRecM1 = tailRecM(dictMonadRec_58)
    local voidRight = Data_Functor.voidRight(dictMonadRec_58.Monad0(Prim.undefined).Bind1(Prim.undefined).Apply0(Prim.undefined).Functor0(Prim.undefined))
    return function(ma_59)
      return (tailRecM1(function(u_60)
        return (voidRight(Loop(u_60)))(ma_59)
      end))(Data_Unit.unit)
    end
  end
  local bifunctorStep = {
    bimap = function(v_61)
      return function(v1_62)
        return function(v2_63)
          if "Control.Monad.Rec.Class.Loop" == v2_63["$ctor"] then
            return (function()
              local f = v_61
              local a = v2_63[0]
              return Loop(f(a))
            end)()
          else
            return (function()
              if "Control.Monad.Rec.Class.Done" == v2_63["$ctor"] then
                return (function()
                  local b = v2_63[0]
                  local g = v1_62
                  return Done(g(b))
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end
      end
    end
  }
  return {
    Loop = Loop,
    Done = Done,
    tailRec = tailRec,
    tailRec2 = tailRec2,
    tailRec3 = tailRec3,
    tailRecM = tailRecM,
    tailRecM2 = tailRecM2,
    tailRecM3 = tailRecM3,
    forever = forever,
    whileJust = whileJust,
    untilJust = untilJust,
    loop2 = loop2,
    loop3 = loop3,
    functorStep = functorStep,
    bifunctorStep = bifunctorStep,
    monadRecIdentity = monadRecIdentity,
    monadRecEffect = monadRecEffect,
    monadRecFunction = monadRecFunction,
    monadRecEither = monadRecEither,
    monadRecMaybe = monadRecMaybe
  }
end)()
local Control_Monad_ST_Internal = (function()
  local foreign = (function()
    return {
        map_ = function(f)
            return function(a)
                return function() return f(a()) end
            end
        end,

        pure_ = function(a)
            return function() return a end
        end,

        bind_ = function(a)
            return function(f)
                return function() return f(a())() end
            end
        end,

        run = function(f) return f() end,

        ["while"] = function(f)
            return function(a)
                return function()
                    while f() do a() end
                end
            end
        end,

        ["for"] = function(lo)
            return function(hi)
                return function(f)
                    return function()
                        for i = lo, hi do
                            f(i)()
                        end
                    end
                end
            end
        end,

        foreach = function(as)
            return function(f)
                return function()
                    for i = 1, #as do
                        f(as[i])()
                    end
                end
            end
        end,

        new = function(val)
            return function() return { value = val } end
        end,

        read = function(ref)
            return function() return ref.value end
        end,

        modifyImpl = function(f)
            return function(ref)
                return function()
                    local t = f(ref.value)
                    ref.value = t.state
                    return t.value
                end
            end
        end,

        write = function(a)
            return function(ref)
                return function()
                    ref.value = a
                    return a
                end
            end
        end,
    }

  end)()
  local map_ = foreign.map_
  local pure_ = foreign.pure_
  local bind_ = foreign.bind_
  local run = foreign.run
  local _while_ = foreign._while_
  local _for_ = foreign._for_
  local foreach = foreign.foreach
  local new = foreign.new
  local read = foreign.read
  local modifyImpl = foreign.modifyImpl
  local write = foreign.write
  local modifyPrime = modifyImpl
  local modify = function(f_0)
    return modifyPrime(function(s_1)
      local sPrime = f_0(s_1)
      return { state = sPrime, value = sPrime }
    end)
  end
  local functorST = { map = map_ }
  local map = Data_Functor.map(functorST)
  local void = Data_Functor.void(functorST)
  local monadST, bindST, applicativeST, _S___lazy_applyST, applyST
  monadST = {
    Applicative0 = function() return applicativeST end,
    Bind1 = function() return bindST end
  }
  bindST = { bind = bind_, Apply0 = function() return _S___lazy_applyST(0) end }
  applicativeST = {
    pure = pure_,
    Apply0 = function() return _S___lazy_applyST(0) end
  }
  _S___lazy_applyST = (_S___runtime_lazy("applyST"))(function()
    return {
      apply = Control_Monad.ap(monadST),
      Functor0 = function() return functorST end
    }
  end)
  applyST = _S___lazy_applyST(0)
  local lift2 = Control_Apply.lift2(applyST)
  local bind = Control_Bind.bind(bindST)
  local bindFlipped = Control_Bind.bindFlipped(bindST)
  local discard = (Control_Bind.discard(Control_Bind.discardUnit))(bindST)
  local pure = Control_Applicative.pure(applicativeST)
  local semigroupST = function(dictSemigroup_2)
    return { append = lift2(Data_Semigroup.append(dictSemigroup_2)) }
  end
  local monadRecST = {
    tailRecM = function(f_3)
      return function(a_4)
        local isLooping = function(v_8)
          return (function()
            if "Control.Monad.Rec.Class.Loop" == v_8["$ctor"] then
              return true
            else
              return false
            end
          end)()
        end
        local fromDone = Partial_Unsafe.unsafePartial(function()
          return function(v_9)
            return (function()
              return (function()
                if "Control.Monad.Rec.Class.Done" == v_9["$ctor"] then
                  return (function() local b = v_9[0] return b end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end)(Prim.undefined)
          end
        end)
        return (bind((bindFlipped(new))(f_3(a_4))))(function(r_5)
          return (discard((_while_((map(isLooping))(read(r_5))))((bind(read(r_5)))(function( v_6 )
            return (function()
              if "Control.Monad.Rec.Class.Loop" == v_6["$ctor"] then
                return (function()
                  local aPrime = v_6[0]
                  return (bind(f_3(aPrime)))(function(e_7)
                    return void((write(e_7))(r_5))
                  end)
                end)()
              else
                return (function()
                  if "Control.Monad.Rec.Class.Done" == v_6["$ctor"] then
                    return pure(Data_Unit.unit)
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end)()
          end))))(function() return (map(fromDone))(read(r_5)) end)
        end)
      end
    end,
    Monad0 = function() return monadST end
  }
  local monoidST = function(dictMonoid_10)
    local semigroupST1 = semigroupST(dictMonoid_10.Semigroup0(Prim.undefined))
    return {
      mempty = pure(Data_Monoid.mempty(dictMonoid_10)),
      Semigroup0 = function() return semigroupST1 end
    }
  end
  return {
    run = run,
    _while_ = _while_,
    _for_ = _for_,
    foreach = foreach,
    new = new,
    read = read,
    modifyPrime = modifyPrime,
    modify = modify,
    write = write,
    functorST = functorST,
    applyST = applyST,
    applicativeST = applicativeST,
    bindST = bindST,
    monadST = monadST,
    monadRecST = monadRecST,
    semigroupST = semigroupST,
    monoidST = monoidST
  }
end)()
local Control_Monad_ST = (function() return {} end)()
local Control_Monad_ST_Ref = (function() return {} end)()
local Data_Functor_App = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local App = function(x_0) return x_0 end
  local showApp = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local fa = v_2
          return (append("(App "))((append(show(fa)))(")"))
        end)()
      end
    }
  end
  local semigroupApp = function(dictApply_3)
    local lift2 = Control_Apply.lift2(dictApply_3)
    return function(dictSemigroup_4)
      return (function()
        local append1 = Data_Semigroup.append(dictSemigroup_4)
        return {
          append = function(v_5)
            return function(v1_6)
              return (function()
                local fa2 = v1_6
                local fa1 = v_5
                return ((lift2(append1))(fa1))(fa2)
              end)()
            end
          end
        }
      end)()
    end
  end
  local plusApp = function(dictPlus_7) return dictPlus_7 end
  local newtypeApp = { Coercible0 = function() return Prim.undefined end }
  local monoidApp = function(dictApplicative_8)
    local pure = Control_Applicative.pure(dictApplicative_8)
    local semigroupApp1 = semigroupApp(dictApplicative_8.Apply0(Prim.undefined))
    return function(dictMonoid_9)
      return (function()
        local semigroupApp2 = semigroupApp1(dictMonoid_9.Semigroup0(Prim.undefined))
        return {
          mempty = pure(Data_Monoid.mempty(dictMonoid_9)),
          Semigroup0 = function() return semigroupApp2 end
        }
      end)()
    end
  end
  local monadPlusApp = function(dictMonadPlus_10) return dictMonadPlus_10 end
  local monadApp = function(dictMonad_11) return dictMonad_11 end
  local lazyApp = function(dictLazy_12) return dictLazy_12 end
  local hoistLowerApp = Unsafe_Coerce.unsafeCoerce
  local hoistLiftApp = Unsafe_Coerce.unsafeCoerce
  local hoistApp = function(f_13)
    return function(v_14) local fa = v_14 local f1 = f_13 return f1(fa) end
  end
  local functorApp = function(dictFunctor_15) return dictFunctor_15 end
  local extendApp = function(dictExtend_16) return dictExtend_16 end
  local eqApp = function(dictEq1_17)
    local eq1 = Data_Eq.eq1(dictEq1_17)
    return function(dictEq_18)
      return (function()
        local eq11 = eq1(dictEq_18)
        return {
          eq = function(x_19)
            return function(y_20)
              return (function()
                local r = y_20
                local l = x_19
                return (eq11(l))(r)
              end)()
            end
          end
        }
      end)()
    end
  end
  local ordApp = function(dictOrd1_21)
    local compare1 = Data_Ord.compare1(dictOrd1_21)
    local eqApp1 = eqApp(dictOrd1_21.Eq10(Prim.undefined))
    return function(dictOrd_22)
      return (function()
        local compare11 = compare1(dictOrd_22)
        local eqApp2 = eqApp1(dictOrd_22.Eq0(Prim.undefined))
        return {
          compare = function(x_23)
            return function(y_24)
              return (function()
                local r = y_24
                local l = x_23
                return (compare11(l))(r)
              end)()
            end
          end,
          Eq0 = function() return eqApp2 end
        }
      end)()
    end
  end
  local eq1App = function(dictEq1_25)
    local eqApp1 = eqApp(dictEq1_25)
    return {
      eq1 = function(dictEq_26) return Data_Eq.eq(eqApp1(dictEq_26)) end
    }
  end
  local ord1App = function(dictOrd1_27)
    local ordApp1 = ordApp(dictOrd1_27)
    local eq1App1 = eq1App(dictOrd1_27.Eq10(Prim.undefined))
    return {
      compare1 = function(dictOrd_28)
        return Data_Ord.compare(ordApp1(dictOrd_28))
      end,
      Eq10 = function() return eq1App1 end
    }
  end
  local comonadApp = function(dictComonad_29) return dictComonad_29 end
  local bindApp = function(dictBind_30) return dictBind_30 end
  local applyApp = function(dictApply_31) return dictApply_31 end
  local applicativeApp = function(dictApplicative_32)
    return dictApplicative_32
  end
  local alternativeApp = function(dictAlternative_33)
    return dictAlternative_33
  end
  local altApp = function(dictAlt_34) return dictAlt_34 end
  return {
    App = App,
    hoistApp = hoistApp,
    hoistLiftApp = hoistLiftApp,
    hoistLowerApp = hoistLowerApp,
    newtypeApp = newtypeApp,
    eqApp = eqApp,
    eq1App = eq1App,
    ordApp = ordApp,
    ord1App = ord1App,
    showApp = showApp,
    semigroupApp = semigroupApp,
    monoidApp = monoidApp,
    functorApp = functorApp,
    applyApp = applyApp,
    applicativeApp = applicativeApp,
    bindApp = bindApp,
    monadApp = monadApp,
    altApp = altApp,
    plusApp = plusApp,
    alternativeApp = alternativeApp,
    monadPlusApp = monadPlusApp,
    lazyApp = lazyApp,
    extendApp = extendApp,
    comonadApp = comonadApp
  }
end)()
local Data_Functor_Compose = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local Compose = function(x_0) return x_0 end
  local showCompose = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local fga = v_2
          return (append("(Compose "))((append(show(fga)))(")"))
        end)()
      end
    }
  end
  local newtypeCompose = { Coercible0 = function() return Prim.undefined end }
  local functorCompose = function(dictFunctor_3)
    local map = Data_Functor.map(dictFunctor_3)
    return function(dictFunctor1_4)
      return (function()
        local map1 = Data_Functor.map(dictFunctor1_4)
        return {
          map = function(f_5)
            return function(v_6)
              return (function()
                local fga = v_6
                local f1 = f_5
                return (map(map1(f1)))(fga)
              end)()
            end
          end
        }
      end)()
    end
  end
  local eqCompose = function(dictEq1_7)
    local eq1 = Data_Eq.eq1(dictEq1_7)
    return function(dictEq11_8)
      return (function()
        local eqApp = Data_Functor_App.eqApp(dictEq11_8)
        return function(dictEq_9)
          return (function()
            local eq11 = eq1(eqApp(dictEq_9))
            return {
              eq = function(v_10)
                return function(v1_11)
                  return (function()
                    local fga2 = v1_11
                    local fga1 = v_10
                    return (eq11(Data_Functor_App.hoistLiftApp(fga1)))(Data_Functor_App.hoistLiftApp(fga2))
                  end)()
                end
              end
            }
          end)()
        end
      end)()
    end
  end
  local ordCompose = function(dictOrd1_12)
    local compare1 = Data_Ord.compare1(dictOrd1_12)
    local eqCompose1 = eqCompose(dictOrd1_12.Eq10(Prim.undefined))
    return function(dictOrd11_13)
      return (function()
        local ordApp = Data_Functor_App.ordApp(dictOrd11_13)
        local eqCompose2 = eqCompose1(dictOrd11_13.Eq10(Prim.undefined))
        return function(dictOrd_14)
          return (function()
            local compare11 = compare1(ordApp(dictOrd_14))
            local eqCompose3 = eqCompose2(dictOrd_14.Eq0(Prim.undefined))
            return {
              compare = function(v_15)
                return function(v1_16)
                  return (function()
                    local fga2 = v1_16
                    local fga1 = v_15
                    return (compare11(Data_Functor_App.hoistLiftApp(fga1)))(Data_Functor_App.hoistLiftApp(fga2))
                  end)()
                end
              end,
              Eq0 = function() return eqCompose3 end
            }
          end)()
        end
      end)()
    end
  end
  local eq1Compose = function(dictEq1_17)
    local eqCompose1 = eqCompose(dictEq1_17)
    return function(dictEq11_18)
      return (function()
        local eqCompose2 = eqCompose1(dictEq11_18)
        return {
          eq1 = function(dictEq_19) return Data_Eq.eq(eqCompose2(dictEq_19)) end
        }
      end)()
    end
  end
  local ord1Compose = function(dictOrd1_20)
    local ordCompose1 = ordCompose(dictOrd1_20)
    local eq1Compose1 = eq1Compose(dictOrd1_20.Eq10(Prim.undefined))
    return function(dictOrd11_21)
      return (function()
        local ordCompose2 = ordCompose1(dictOrd11_21)
        local eq1Compose2 = eq1Compose1(dictOrd11_21.Eq10(Prim.undefined))
        return {
          compare1 = function(dictOrd_22)
            return Data_Ord.compare(ordCompose2(dictOrd_22))
          end,
          Eq10 = function() return eq1Compose2 end
        }
      end)()
    end
  end
  local bihoistCompose = function(dictFunctor_23)
    local map = Data_Functor.map(dictFunctor_23)
    return function(natF_24)
      return function(natG_25)
        return function(v_26)
          return (function()
            local fga = v_26
            local natG1 = natG_25
            local natF1 = natF_24
            return natF1((map(natG1))(fga))
          end)()
        end
      end
    end
  end
  local applyCompose = function(dictApply_27)
    local apply = Control_Apply.apply(dictApply_27)
    local Functor0 = dictApply_27.Functor0(Prim.undefined)
    local map = Data_Functor.map(Functor0)
    local functorCompose1 = functorCompose(Functor0)
    return function(dictApply1_28)
      return (function()
        local apply1 = Control_Apply.apply(dictApply1_28)
        local functorCompose2 = functorCompose1(dictApply1_28.Functor0(Prim.undefined))
        return {
          apply = function(v_29)
            return function(v1_30)
              return (function()
                local x = v1_30
                local f = v_29
                return (apply((map(apply1))(f)))(x)
              end)()
            end
          end,
          Functor0 = function() return functorCompose2 end
        }
      end)()
    end
  end
  local applicativeCompose = function(dictApplicative_31)
    local pure = Control_Applicative.pure(dictApplicative_31)
    local applyCompose1 = applyCompose(dictApplicative_31.Apply0(Prim.undefined))
    return function(dictApplicative1_32)
      return (function()
        local applyCompose2 = applyCompose1(dictApplicative1_32.Apply0(Prim.undefined))
        return {
          pure = (compose(Compose))((compose(pure))(Control_Applicative.pure(dictApplicative1_32))),
          Apply0 = function() return applyCompose2 end
        }
      end)()
    end
  end
  local altCompose = function(dictAlt_33)
    local alt = Control_Alt.alt(dictAlt_33)
    local functorCompose1 = functorCompose(dictAlt_33.Functor0(Prim.undefined))
    return function(dictFunctor_34)
      return (function()
        local functorCompose2 = functorCompose1(dictFunctor_34)
        return {
          alt = function(v_35)
            return function(v1_36)
              return (function()
                local b = v1_36
                local a = v_35
                return (alt(a))(b)
              end)()
            end
          end,
          Functor0 = function() return functorCompose2 end
        }
      end)()
    end
  end
  local plusCompose = function(dictPlus_37)
    local empty = Control_Plus.empty(dictPlus_37)
    local altCompose1 = altCompose(dictPlus_37.Alt0(Prim.undefined))
    return function(dictFunctor_38)
      return (function()
        local altCompose2 = altCompose1(dictFunctor_38)
        return { empty = empty, Alt0 = function() return altCompose2 end }
      end)()
    end
  end
  local alternativeCompose = function(dictAlternative_39)
    local applicativeCompose1 = applicativeCompose(dictAlternative_39.Applicative0(Prim.undefined))
    local plusCompose1 = plusCompose(dictAlternative_39.Plus1(Prim.undefined))
    return function(dictApplicative_40)
      return (function()
        local applicativeCompose2 = applicativeCompose1(dictApplicative_40)
        local plusCompose2 = plusCompose1(dictApplicative_40.Apply0(Prim.undefined).Functor0(Prim.undefined))
        return {
          Applicative0 = function() return applicativeCompose2 end,
          Plus1 = function() return plusCompose2 end
        }
      end)()
    end
  end
  return {
    Compose = Compose,
    bihoistCompose = bihoistCompose,
    newtypeCompose = newtypeCompose,
    eqCompose = eqCompose,
    eq1Compose = eq1Compose,
    ordCompose = ordCompose,
    ord1Compose = ord1Compose,
    showCompose = showCompose,
    functorCompose = functorCompose,
    applyCompose = applyCompose,
    applicativeCompose = applicativeCompose,
    altCompose = altCompose,
    plusCompose = plusCompose,
    alternativeCompose = alternativeCompose
  }
end)()
local Data_Functor_Coproduct = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local bimap = Data_Bifunctor.bimap(Data_Bifunctor.bifunctorEither)
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local Coproduct = function(x_0) return x_0 end
  local showCoproduct = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return function(dictShow1_2)
      return (function()
        local show1 = Data_Show.show(dictShow1_2)
        return {
          show = function(v_3)
            return (function()
              if "Data.Either.Left" == v_3["$ctor"] then
                return (function()
                  local fa = v_3[0]
                  return (append("(left "))((append(show(fa)))(")"))
                end)()
              else
                return (function()
                  if "Data.Either.Right" == v_3["$ctor"] then
                    return (function()
                      local ga = v_3[0]
                      return (append("(right "))((append(show1(ga)))(")"))
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end)()
          end
        }
      end)()
    end
  end
  local right = function(ga_4) return Data_Either.Right(ga_4) end
  local newtypeCoproduct = { Coercible0 = function() return Prim.undefined end }
  local left = function(fa_5) return Data_Either.Left(fa_5) end
  local functorCoproduct = function(dictFunctor_6)
    local map = Data_Functor.map(dictFunctor_6)
    return function(dictFunctor1_7)
      return (function()
        local map1 = Data_Functor.map(dictFunctor1_7)
        return {
          map = function(f_8)
            return function(v_9)
              return (function()
                local e = v_9
                local f1 = f_8
                return ((bimap(map(f1)))(map1(f1)))(e)
              end)()
            end
          end
        }
      end)()
    end
  end
  local eq1Coproduct = function(dictEq1_10)
    local eq1 = Data_Eq.eq1(dictEq1_10)
    return function(dictEq11_11)
      return (function()
        local eq11 = Data_Eq.eq1(dictEq11_11)
        return {
          eq1 = function(dictEq_12)
            return (function()
              local eq12 = eq1(dictEq_12)
              local eq13 = eq11(dictEq_12)
              return function(v_13)
                return function(v1_14)
                  return (function()
                    local y = v1_14
                    local x = v_13
                    return (function()
                      if "Data.Either.Left" == x["$ctor"] then
                        return (function()
                          if "Data.Either.Left" == y["$ctor"] then
                            return (function()
                              local fa = x[0]
                              local ga = y[0]
                              return (eq12(fa))(ga)
                            end)()
                          else
                            return false
                          end
                        end)()
                      else
                        return (function()
                          if "Data.Either.Right" == x["$ctor"] then
                            return (function()
                              if "Data.Either.Right" == y["$ctor"] then
                                return (function()
                                  local ga = y[0]
                                  local fa = x[0]
                                  return (eq13(fa))(ga)
                                end)()
                              else
                                return false
                              end
                            end)()
                          else
                            return false
                          end
                        end)()
                      end
                    end)()
                  end)()
                end
              end
            end)()
          end
        }
      end)()
    end
  end
  local eqCoproduct = function(dictEq1_15)
    local eq1Coproduct1 = eq1Coproduct(dictEq1_15)
    return function(dictEq11_16)
      return (function()
        local eq1 = Data_Eq.eq1(eq1Coproduct1(dictEq11_16))
        return function(dictEq_17) return { eq = eq1(dictEq_17) } end
      end)()
    end
  end
  local ord1Coproduct = function(dictOrd1_18)
    local compare1 = Data_Ord.compare1(dictOrd1_18)
    local eq1Coproduct1 = eq1Coproduct(dictOrd1_18.Eq10(Prim.undefined))
    return function(dictOrd11_19)
      return (function()
        local compare11 = Data_Ord.compare1(dictOrd11_19)
        local eq1Coproduct2 = eq1Coproduct1(dictOrd11_19.Eq10(Prim.undefined))
        return {
          compare1 = function(dictOrd_20)
            return (function()
              local compare12 = compare1(dictOrd_20)
              local compare13 = compare11(dictOrd_20)
              return function(v_21)
                return function(v1_22)
                  return (function()
                    local y = v1_22
                    local x = v_21
                    return (function()
                      if "Data.Either.Left" == x["$ctor"] then
                        return (function()
                          if "Data.Either.Left" == y["$ctor"] then
                            return (function()
                              local fa = x[0]
                              local ga = y[0]
                              return (compare12(fa))(ga)
                            end)()
                          else
                            return Data_Ordering.LT
                          end
                        end)()
                      else
                        return (function()
                          if "Data.Either.Left" == y["$ctor"] then
                            return Data_Ordering.GT
                          else
                            return (function()
                              if "Data.Either.Right" == x["$ctor"] then
                                return (function()
                                  if "Data.Either.Right" == y["$ctor"] then
                                    return (function()
                                      local ga = y[0]
                                      local fa = x[0]
                                      return (compare13(fa))(ga)
                                    end)()
                                  else
                                    return error("No patterns matched")
                                  end
                                end)()
                              else
                                return error("No patterns matched")
                              end
                            end)()
                          end
                        end)()
                      end
                    end)()
                  end)()
                end
              end
            end)()
          end,
          Eq10 = function() return eq1Coproduct2 end
        }
      end)()
    end
  end
  local ordCoproduct = function(dictOrd1_23)
    local ord1Coproduct1 = ord1Coproduct(dictOrd1_23)
    local eqCoproduct1 = eqCoproduct(dictOrd1_23.Eq10(Prim.undefined))
    return function(dictOrd11_24)
      return (function()
        local compare1 = Data_Ord.compare1(ord1Coproduct1(dictOrd11_24))
        local eqCoproduct2 = eqCoproduct1(dictOrd11_24.Eq10(Prim.undefined))
        return function(dictOrd_25)
          return (function()
            local eqCoproduct3 = eqCoproduct2(dictOrd_25.Eq0(Prim.undefined))
            return {
              compare = compare1(dictOrd_25),
              Eq0 = function() return eqCoproduct3 end
            }
          end)()
        end
      end)()
    end
  end
  local coproduct = function(v_26)
    return function(v1_27)
      return function(v2_28)
        if "Data.Either.Left" == v2_28["$ctor"] then
          return (function()
            local f = v_26
            local a = v2_28[0]
            return f(a)
          end)()
        else
          return (function()
            if "Data.Either.Right" == v2_28["$ctor"] then
              return (function()
                local b = v2_28[0]
                local g = v1_27
                return g(b)
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end
  end
  local extendCoproduct = function(dictExtend_29)
    local extend = Control_Extend.extend(dictExtend_29)
    local functorCoproduct1 = functorCoproduct(dictExtend_29.Functor0(Prim.undefined))
    return function(dictExtend1_30)
      return (function()
        local extend1 = Control_Extend.extend(dictExtend1_30)
        local functorCoproduct2 = functorCoproduct1(dictExtend1_30.Functor0(Prim.undefined))
        return {
          extend = function(f_31)
            return (compose(Coproduct))((coproduct((compose(Data_Either.Left))(extend((compose(f_31))((compose(Coproduct))(Data_Either.Left))))))((compose(Data_Either.Right))(extend1((compose(f_31))((compose(Coproduct))(Data_Either.Right))))))
          end,
          Functor0 = function() return functorCoproduct2 end
        }
      end)()
    end
  end
  local comonadCoproduct = function(dictComonad_32)
    local extract = Control_Comonad.extract(dictComonad_32)
    local extendCoproduct1 = extendCoproduct(dictComonad_32.Extend0(Prim.undefined))
    return function(dictComonad1_33)
      return (function()
        local extendCoproduct2 = extendCoproduct1(dictComonad1_33.Extend0(Prim.undefined))
        return {
          extract = (coproduct(extract))(Control_Comonad.extract(dictComonad1_33)),
          Extend0 = function() return extendCoproduct2 end
        }
      end)()
    end
  end
  local bihoistCoproduct = function(natF_34)
    return function(natG_35)
      return function(v_36)
        local e = v_36
        local natG1 = natG_35
        local natF1 = natF_34
        return ((bimap(natF1))(natG1))(e)
      end
    end
  end
  return {
    Coproduct = Coproduct,
    left = left,
    right = right,
    coproduct = coproduct,
    bihoistCoproduct = bihoistCoproduct,
    newtypeCoproduct = newtypeCoproduct,
    eqCoproduct = eqCoproduct,
    eq1Coproduct = eq1Coproduct,
    ordCoproduct = ordCoproduct,
    ord1Coproduct = ord1Coproduct,
    showCoproduct = showCoproduct,
    functorCoproduct = functorCoproduct,
    extendCoproduct = extendCoproduct,
    comonadCoproduct = comonadCoproduct
  }
end)()
local Data_Functor_Product = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local bimap = Data_Bifunctor.bimap(Data_Bifunctor.bifunctorTuple)
  local conj = Data_HeytingAlgebra.conj(Data_HeytingAlgebra.heytingAlgebraBoolean)
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local unwrap = Data_Newtype.unwrap(Prim.undefined)
  local Product = function(x_0) return x_0 end
  local showProduct = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return function(dictShow1_2)
      return (function()
        local show1 = Data_Show.show(dictShow1_2)
        return {
          show = function(v_3)
            return (function()
              if "Data.Tuple.Tuple" == v_3["$ctor"] then
                return (function()
                  local ga = v_3[1]
                  local fa = v_3[0]
                  return (append("(product "))((append(show(fa)))((append(" "))((append(show1(ga)))(")"))))
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        }
      end)()
    end
  end
  local product = function(fa_4)
    return function(ga_5) return (Data_Tuple.Tuple(fa_4))(ga_5) end
  end
  local newtypeProduct = { Coercible0 = function() return Prim.undefined end }
  local functorProduct = function(dictFunctor_6)
    local map = Data_Functor.map(dictFunctor_6)
    return function(dictFunctor1_7)
      return (function()
        local map1 = Data_Functor.map(dictFunctor1_7)
        return {
          map = function(f_8)
            return function(v_9)
              return (function()
                local fga = v_9
                local f1 = f_8
                return ((bimap(map(f1)))(map1(f1)))(fga)
              end)()
            end
          end
        }
      end)()
    end
  end
  local eq1Product = function(dictEq1_10)
    local eq1 = Data_Eq.eq1(dictEq1_10)
    return function(dictEq11_11)
      return (function()
        local eq11 = Data_Eq.eq1(dictEq11_11)
        return {
          eq1 = function(dictEq_12)
            return (function()
              local eq12 = eq1(dictEq_12)
              local eq13 = eq11(dictEq_12)
              return function(v_13)
                return function(v1_14)
                  return (function()
                    if "Data.Tuple.Tuple" == v_13["$ctor"] then
                      return (function()
                        if "Data.Tuple.Tuple" == v1_14["$ctor"] then
                          return (function()
                            local r2 = v1_14[1]
                            local l2 = v1_14[0]
                            local r1 = v_13[1]
                            local l1 = v_13[0]
                            return (conj((eq12(l1))(l2)))((eq13(r1))(r2))
                          end)()
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end
            end)()
          end
        }
      end)()
    end
  end
  local eqProduct = function(dictEq1_15)
    local eq1Product1 = eq1Product(dictEq1_15)
    return function(dictEq11_16)
      return (function()
        local eq1 = Data_Eq.eq1(eq1Product1(dictEq11_16))
        return function(dictEq_17) return { eq = eq1(dictEq_17) } end
      end)()
    end
  end
  local ord1Product = function(dictOrd1_18)
    local compare1 = Data_Ord.compare1(dictOrd1_18)
    local eq1Product1 = eq1Product(dictOrd1_18.Eq10(Prim.undefined))
    return function(dictOrd11_19)
      return (function()
        local compare11 = Data_Ord.compare1(dictOrd11_19)
        local eq1Product2 = eq1Product1(dictOrd11_19.Eq10(Prim.undefined))
        return {
          compare1 = function(dictOrd_20)
            return (function()
              local compare12 = compare1(dictOrd_20)
              local compare13 = compare11(dictOrd_20)
              return function(v_21)
                return function(v1_22)
                  return (function()
                    if "Data.Tuple.Tuple" == v_21["$ctor"] then
                      return (function()
                        if "Data.Tuple.Tuple" == v1_22["$ctor"] then
                          return (function()
                            local r2 = v1_22[1]
                            local l2 = v1_22[0]
                            local r1 = v_21[1]
                            local l1 = v_21[0]
                            return (function()
                              local v2 = (compare12(l1))(l2)
                              return (function()
                                if "Data.Ordering.EQ" == v2["$ctor"] then
                                  return (compare13(r1))(r2)
                                else
                                  return (function()
                                    local o = v2
                                    return o
                                  end)()
                                end
                              end)()
                            end)()
                          end)()
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end
            end)()
          end,
          Eq10 = function() return eq1Product2 end
        }
      end)()
    end
  end
  local ordProduct = function(dictOrd1_23)
    local ord1Product1 = ord1Product(dictOrd1_23)
    local eqProduct1 = eqProduct(dictOrd1_23.Eq10(Prim.undefined))
    return function(dictOrd11_24)
      return (function()
        local compare1 = Data_Ord.compare1(ord1Product1(dictOrd11_24))
        local eqProduct2 = eqProduct1(dictOrd11_24.Eq10(Prim.undefined))
        return function(dictOrd_25)
          return (function()
            local eqProduct3 = eqProduct2(dictOrd_25.Eq0(Prim.undefined))
            return {
              compare = compare1(dictOrd_25),
              Eq0 = function() return eqProduct3 end
            }
          end)()
        end
      end)()
    end
  end
  local bihoistProduct = function(natF_26)
    return function(natG_27)
      return function(v_28)
        local e = v_28
        local natG1 = natG_27
        local natF1 = natF_26
        return ((bimap(natF1))(natG1))(e)
      end
    end
  end
  local applyProduct = function(dictApply_29)
    local apply = Control_Apply.apply(dictApply_29)
    local functorProduct1 = functorProduct(dictApply_29.Functor0(Prim.undefined))
    return function(dictApply1_30)
      return (function()
        local apply1 = Control_Apply.apply(dictApply1_30)
        local functorProduct2 = functorProduct1(dictApply1_30.Functor0(Prim.undefined))
        return {
          apply = function(v_31)
            return function(v1_32)
              return (function()
                if "Data.Tuple.Tuple" == v_31["$ctor"] then
                  return (function()
                    if "Data.Tuple.Tuple" == v1_32["$ctor"] then
                      return (function()
                        local b = v1_32[1]
                        local a = v1_32[0]
                        local g = v_31[1]
                        local f = v_31[0]
                        return (product((apply(f))(a)))((apply1(g))(b))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end,
          Functor0 = function() return functorProduct2 end
        }
      end)()
    end
  end
  local bindProduct = function(dictBind_33)
    local bind = Control_Bind.bind(dictBind_33)
    local applyProduct1 = applyProduct(dictBind_33.Apply0(Prim.undefined))
    return function(dictBind1_34)
      return (function()
        local bind1 = Control_Bind.bind(dictBind1_34)
        local applyProduct2 = applyProduct1(dictBind1_34.Apply0(Prim.undefined))
        return {
          bind = function(v_35)
            return function(f_36)
              return (function()
                if "Data.Tuple.Tuple" == v_35["$ctor"] then
                  return (function()
                    local f1 = f_36
                    local ga = v_35[1]
                    local fa = v_35[0]
                    return (product((bind(fa))((compose(Data_Tuple.fst))((compose(unwrap))(f1)))))((bind1(ga))((compose(Data_Tuple.snd))((compose(unwrap))(f1))))
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end,
          Apply0 = function() return applyProduct2 end
        }
      end)()
    end
  end
  local applicativeProduct = function(dictApplicative_37)
    local pure = Control_Applicative.pure(dictApplicative_37)
    local applyProduct1 = applyProduct(dictApplicative_37.Apply0(Prim.undefined))
    return function(dictApplicative1_38)
      return (function()
        local pure1 = Control_Applicative.pure(dictApplicative1_38)
        local applyProduct2 = applyProduct1(dictApplicative1_38.Apply0(Prim.undefined))
        return {
          pure = function(a_39) return (product(pure(a_39)))(pure1(a_39)) end,
          Apply0 = function() return applyProduct2 end
        }
      end)()
    end
  end
  local monadProduct = function(dictMonad_40)
    local applicativeProduct1 = applicativeProduct(dictMonad_40.Applicative0(Prim.undefined))
    local bindProduct1 = bindProduct(dictMonad_40.Bind1(Prim.undefined))
    return function(dictMonad1_41)
      return (function()
        local applicativeProduct2 = applicativeProduct1(dictMonad1_41.Applicative0(Prim.undefined))
        local bindProduct2 = bindProduct1(dictMonad1_41.Bind1(Prim.undefined))
        return {
          Applicative0 = function() return applicativeProduct2 end,
          Bind1 = function() return bindProduct2 end
        }
      end)()
    end
  end
  return {
    Product = Product,
    product = product,
    bihoistProduct = bihoistProduct,
    newtypeProduct = newtypeProduct,
    eqProduct = eqProduct,
    eq1Product = eq1Product,
    ordProduct = ordProduct,
    ord1Product = ord1Product,
    showProduct = showProduct,
    functorProduct = functorProduct,
    applyProduct = applyProduct,
    applicativeProduct = applicativeProduct,
    bindProduct = bindProduct,
    monadProduct = monadProduct
  }
end)()
local Data_Maybe_First = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local First = function(x_0) return x_0 end
  local showFirst = function(dictShow_1)
    local show = Data_Show.show(Data_Maybe.showMaybe(dictShow_1))
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("First ("))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semigroupFirst = {
    append = function(v_3)
      return function(v1_4)
        if "Data.Maybe.Just" == v_3["$ctor"] then
          return (function() local first = v_3 return first end)()
        else
          return (function() local second = v1_4 return second end)()
        end
      end
    end
  }
  local ordFirst = function(dictOrd_5) return Data_Maybe.ordMaybe(dictOrd_5) end
  local ord1First = Data_Maybe.ord1Maybe
  local newtypeFirst = { Coercible0 = function() return Prim.undefined end }
  local monoidFirst = {
    mempty = Data_Maybe.Nothing,
    Semigroup0 = function() return semigroupFirst end
  }
  local monadFirst = Data_Maybe.monadMaybe
  local invariantFirst = Data_Maybe.invariantMaybe
  local functorFirst = Data_Maybe.functorMaybe
  local extendFirst = Data_Maybe.extendMaybe
  local eqFirst = function(dictEq_6) return Data_Maybe.eqMaybe(dictEq_6) end
  local eq1First = Data_Maybe.eq1Maybe
  local boundedFirst = function(dictBounded_7)
    return Data_Maybe.boundedMaybe(dictBounded_7)
  end
  local bindFirst = Data_Maybe.bindMaybe
  local applyFirst = Data_Maybe.applyMaybe
  local applicativeFirst = Data_Maybe.applicativeMaybe
  local altFirst = {
    alt = Data_Semigroup.append(semigroupFirst),
    Functor0 = function() return functorFirst end
  }
  local plusFirst = {
    empty = Data_Monoid.mempty(monoidFirst),
    Alt0 = function() return altFirst end
  }
  local alternativeFirst = {
    Applicative0 = function() return applicativeFirst end,
    Plus1 = function() return plusFirst end
  }
  return {
    First = First,
    newtypeFirst = newtypeFirst,
    eqFirst = eqFirst,
    eq1First = eq1First,
    ordFirst = ordFirst,
    ord1First = ord1First,
    boundedFirst = boundedFirst,
    functorFirst = functorFirst,
    invariantFirst = invariantFirst,
    applyFirst = applyFirst,
    applicativeFirst = applicativeFirst,
    bindFirst = bindFirst,
    monadFirst = monadFirst,
    extendFirst = extendFirst,
    showFirst = showFirst,
    semigroupFirst = semigroupFirst,
    monoidFirst = monoidFirst,
    altFirst = altFirst,
    plusFirst = plusFirst,
    alternativeFirst = alternativeFirst
  }
end)()
local Data_Maybe_Last = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Last = function(x_0) return x_0 end
  local showLast = function(dictShow_1)
    local show = Data_Show.show(Data_Maybe.showMaybe(dictShow_1))
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(Last "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semigroupLast = {
    append = function(v_3)
      return function(v1_4)
        if "Data.Maybe.Just" == v1_4["$ctor"] then
          return (function() local last = v1_4 return last end)()
        else
          return (function()
            if "Data.Maybe.Nothing" == v1_4["$ctor"] then
              return (function() local last = v_3 return last end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end
  }
  local ordLast = function(dictOrd_5) return Data_Maybe.ordMaybe(dictOrd_5) end
  local ord1Last = Data_Maybe.ord1Maybe
  local newtypeLast = { Coercible0 = function() return Prim.undefined end }
  local monoidLast = {
    mempty = Data_Maybe.Nothing,
    Semigroup0 = function() return semigroupLast end
  }
  local monadLast = Data_Maybe.monadMaybe
  local invariantLast = Data_Maybe.invariantMaybe
  local functorLast = Data_Maybe.functorMaybe
  local extendLast = Data_Maybe.extendMaybe
  local eqLast = function(dictEq_6) return Data_Maybe.eqMaybe(dictEq_6) end
  local eq1Last = Data_Maybe.eq1Maybe
  local boundedLast = function(dictBounded_7)
    return Data_Maybe.boundedMaybe(dictBounded_7)
  end
  local bindLast = Data_Maybe.bindMaybe
  local applyLast = Data_Maybe.applyMaybe
  local applicativeLast = Data_Maybe.applicativeMaybe
  local altLast = {
    alt = Data_Semigroup.append(semigroupLast),
    Functor0 = function() return functorLast end
  }
  local plusLast = {
    empty = Data_Monoid.mempty(monoidLast),
    Alt0 = function() return altLast end
  }
  local alternativeLast = {
    Applicative0 = function() return applicativeLast end,
    Plus1 = function() return plusLast end
  }
  return {
    Last = Last,
    newtypeLast = newtypeLast,
    eqLast = eqLast,
    eq1Last = eq1Last,
    ordLast = ordLast,
    ord1Last = ord1Last,
    boundedLast = boundedLast,
    functorLast = functorLast,
    invariantLast = invariantLast,
    applyLast = applyLast,
    applicativeLast = applicativeLast,
    bindLast = bindLast,
    monadLast = monadLast,
    extendLast = extendLast,
    showLast = showLast,
    semigroupLast = semigroupLast,
    monoidLast = monoidLast,
    altLast = altLast,
    plusLast = plusLast,
    alternativeLast = alternativeLast
  }
end)()
local Data_Foldable = (function()
  local foreign = (function()
    return {
        foldrArray = function(f)
            return function(init)
                return function(xs)
                    local acc = init
                    local len = #xs
                    for i = len, 1, -1 do
                        acc = f(xs[i])(acc)
                    end
                    return acc
                end
            end
        end,

        foldlArray = function(f)
            return function(init)
                return function(xs)
                    local acc = init
                    local len = #xs
                    for i = 1, len do
                        acc = f(acc)(xs[i])
                    end
                    return acc
                end
            end
        end
    }

  end)()
  local foldrArray = foreign.foldrArray
  local foldlArray = foreign.foldlArray
  local eq = Data_Eq.eq(Data_Eq.eqInt)
  local add = Data_Semiring.add(Data_Semiring.semiringInt)
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local identity = Control_Category.identity(Control_Category.categoryFn)
  local eq1 = Data_Eq.eq(Data_Ordering.eqOrdering)
  local unwrap = Data_Newtype.unwrap(Prim.undefined)
  local monoidEndo = Data_Monoid_Endo.monoidEndo(Control_Category.categoryFn)
  local monoidDual = Data_Monoid_Dual.monoidDual(monoidEndo)
  local alaF = (((Data_Newtype.alaF(Prim.undefined))(Prim.undefined))(Prim.undefined))(Prim.undefined)
  local _not_ = Data_HeytingAlgebra._not_(Data_HeytingAlgebra.heytingAlgebraBoolean)
  local Foldable_S_Dict = function(x_0) return x_0 end
  local foldr = function(dict_1) local v = dict_1 return v.foldr end
  local indexr = function(dictFoldable_2)
    local foldr2 = foldr(dictFoldable_2)
    return function(idx_3)
      return (function()
        local go = function(a_5)
          return function(cursor_6)
            return (function()
              local e1 = cursor_6.elem
              return (function()
                if "Data.Maybe.Just" == e1["$ctor"] then
                  return cursor_6
                else
                  return (function()
                    local e2 = (eq(cursor_6.pos))(idx_3)
                    return (function()
                      if true == e2 then
                        return {
                          elem = Data_Maybe.Just(a_5),
                          pos = cursor_6.pos
                        }
                      else
                        return {
                          pos = (add(cursor_6.pos))(1),
                          elem = cursor_6.elem
                        }
                      end
                    end)()
                  end)()
                end
              end)()
            end)()
          end
        end
        return (compose(function(v_4) return v_4.elem end))((foldr2(go))({
          elem = Data_Maybe.Nothing,
          pos = 0
        }))
      end)()
    end
  end
  local null = function(dictFoldable_7)
    return ((foldr(dictFoldable_7))(function(v_8)
      return function(v1_9) return false end
    end))(true)
  end
  local oneOf = function(dictFoldable_10)
    local foldr2 = foldr(dictFoldable_10)
    return function(dictPlus_11)
      return (foldr2(Control_Alt.alt(dictPlus_11.Alt0(Prim.undefined))))(Control_Plus.empty(dictPlus_11))
    end
  end
  local oneOfMap = function(dictFoldable_12)
    local foldr2 = foldr(dictFoldable_12)
    return function(dictPlus_13)
      return (function()
        local alt = Control_Alt.alt(dictPlus_13.Alt0(Prim.undefined))
        local empty = Control_Plus.empty(dictPlus_13)
        return function(f_14) return (foldr2((compose(alt))(f_14)))(empty) end
      end)()
    end
  end
  local traverse_ = function(dictApplicative_15)
    local applySecond = Control_Apply.applySecond(dictApplicative_15.Apply0(Prim.undefined))
    local pure = Control_Applicative.pure(dictApplicative_15)
    return function(dictFoldable_16)
      return (function()
        local foldr2 = foldr(dictFoldable_16)
        return function(f_17)
          return (foldr2((compose(applySecond))(f_17)))(pure(Data_Unit.unit))
        end
      end)()
    end
  end
  local for_ = function(dictApplicative_18)
    local traverse_1 = traverse_(dictApplicative_18)
    return function(dictFoldable_19)
      return Data_Function.flip(traverse_1(dictFoldable_19))
    end
  end
  local sequence_ = function(dictApplicative_20)
    local traverse_1 = traverse_(dictApplicative_20)
    return function(dictFoldable_21)
      return (traverse_1(dictFoldable_21))(identity)
    end
  end
  local foldl = function(dict_22) local v = dict_22 return v.foldl end
  local indexl = function(dictFoldable_23)
    local foldl2 = foldl(dictFoldable_23)
    return function(idx_24)
      return (function()
        local go = function(cursor_26)
          return function(a_27)
            return (function()
              local e4 = cursor_26.elem
              return (function()
                if "Data.Maybe.Just" == e4["$ctor"] then
                  return cursor_26
                else
                  return (function()
                    local e5 = (eq(cursor_26.pos))(idx_24)
                    return (function()
                      if true == e5 then
                        return {
                          elem = Data_Maybe.Just(a_27),
                          pos = cursor_26.pos
                        }
                      else
                        return {
                          pos = (add(cursor_26.pos))(1),
                          elem = cursor_26.elem
                        }
                      end
                    end)()
                  end)()
                end
              end)()
            end)()
          end
        end
        return (compose(function(v_25) return v_25.elem end))((foldl2(go))({
          elem = Data_Maybe.Nothing,
          pos = 0
        }))
      end)()
    end
  end
  local intercalate = function(dictFoldable_28)
    local foldl2 = foldl(dictFoldable_28)
    return function(dictMonoid_29)
      return (function()
        local append = Data_Semigroup.append(dictMonoid_29.Semigroup0(Prim.undefined))
        local mempty = Data_Monoid.mempty(dictMonoid_29)
        return function(sep_30)
          return function(xs_31)
            return (function()
              local go = function(v_32)
                return function(v1_33)
                  return (function()
                    if true == v_32.init then
                      return (function()
                        local x = v1_33
                        return { init = false, acc = x }
                      end)()
                    else
                      return (function()
                        local x = v1_33
                        local acc = v_32.acc
                        return {
                          init = false,
                          acc = (append(acc))((append(sep_30))(x))
                        }
                      end)()
                    end
                  end)()
                end
              end
              return ((foldl2(go))({ init = true, acc = mempty }))(xs_31).acc
            end)()
          end
        end
      end)()
    end
  end
  local length = function(dictFoldable_34)
    local foldl2 = foldl(dictFoldable_34)
    return function(dictSemiring_35)
      return (function()
        local add1 = Data_Semiring.add(dictSemiring_35)
        local one = Data_Semiring.one(dictSemiring_35)
        return (foldl2(function(c_36)
          return function(v_37) return (add1(one))(c_36) end
        end))(Data_Semiring.zero(dictSemiring_35))
      end)()
    end
  end
  local maximumBy = function(dictFoldable_38)
    local foldl2 = foldl(dictFoldable_38)
    return function(cmp_39)
      return (function()
        local maxPrime = function(v_40)
          return function(v1_41)
            return (function()
              if "Data.Maybe.Nothing" == v_40["$ctor"] then
                return (function()
                  local x = v1_41
                  return Data_Maybe.Just(x)
                end)()
              else
                return (function()
                  if "Data.Maybe.Just" == v_40["$ctor"] then
                    return (function()
                      local y = v1_41
                      local x = v_40[0]
                      return Data_Maybe.Just((function()
                        local e9 = (eq1((cmp_39(x))(y)))(Data_Ordering.GT)
                        return (function()
                          if true == e9 then return x else return y end
                        end)()
                      end)())
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end)()
          end
        end
        return (foldl2(maxPrime))(Data_Maybe.Nothing)
      end)()
    end
  end
  local maximum = function(dictOrd_42)
    local compare = Data_Ord.compare(dictOrd_42)
    return function(dictFoldable_43)
      return (maximumBy(dictFoldable_43))(compare)
    end
  end
  local minimumBy = function(dictFoldable_44)
    local foldl2 = foldl(dictFoldable_44)
    return function(cmp_45)
      return (function()
        local minPrime = function(v_46)
          return function(v1_47)
            return (function()
              if "Data.Maybe.Nothing" == v_46["$ctor"] then
                return (function()
                  local x = v1_47
                  return Data_Maybe.Just(x)
                end)()
              else
                return (function()
                  if "Data.Maybe.Just" == v_46["$ctor"] then
                    return (function()
                      local y = v1_47
                      local x = v_46[0]
                      return Data_Maybe.Just((function()
                        local e12 = (eq1((cmp_45(x))(y)))(Data_Ordering.LT)
                        return (function()
                          if true == e12 then return x else return y end
                        end)()
                      end)())
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end)()
          end
        end
        return (foldl2(minPrime))(Data_Maybe.Nothing)
      end)()
    end
  end
  local minimum = function(dictOrd_48)
    local compare = Data_Ord.compare(dictOrd_48)
    return function(dictFoldable_49)
      return (minimumBy(dictFoldable_49))(compare)
    end
  end
  local product = function(dictFoldable_50)
    local foldl2 = foldl(dictFoldable_50)
    return function(dictSemiring_51)
      return (foldl2(Data_Semiring.mul(dictSemiring_51)))(Data_Semiring.one(dictSemiring_51))
    end
  end
  local sum = function(dictFoldable_52)
    local foldl2 = foldl(dictFoldable_52)
    return function(dictSemiring_53)
      return (foldl2(Data_Semiring.add(dictSemiring_53)))(Data_Semiring.zero(dictSemiring_53))
    end
  end
  local foldableTuple = {
    foldr = function(f_54)
      return function(z_55)
        return function(v_56)
          if "Data.Tuple.Tuple" == v_56["$ctor"] then
            return (function()
              local x = v_56[1]
              local z1 = z_55
              local f1 = f_54
              return (f1(x))(z1)
            end)()
          else
            return error("No patterns matched")
          end
        end
      end
    end,
    foldl = function(f_57)
      return function(z_58)
        return function(v_59)
          if "Data.Tuple.Tuple" == v_59["$ctor"] then
            return (function()
              local x = v_59[1]
              local z1 = z_58
              local f1 = f_57
              return (f1(z1))(x)
            end)()
          else
            return error("No patterns matched")
          end
        end
      end
    end,
    foldMap = function(dictMonoid_60)
      return function(f_61)
        return function(v_62)
          if "Data.Tuple.Tuple" == v_62["$ctor"] then
            return (function()
              local x = v_62[1]
              local f1 = f_61
              return f1(x)
            end)()
          else
            return error("No patterns matched")
          end
        end
      end
    end
  }
  local foldableMultiplicative = {
    foldr = function(f_63)
      return function(z_64)
        return function(v_65)
          local x = v_65
          local z1 = z_64
          local f1 = f_63
          return (f1(x))(z1)
        end
      end
    end,
    foldl = function(f_66)
      return function(z_67)
        return function(v_68)
          local x = v_68
          local z1 = z_67
          local f1 = f_66
          return (f1(z1))(x)
        end
      end
    end,
    foldMap = function(dictMonoid_69)
      return function(f_70)
        return function(v_71) local x = v_71 local f1 = f_70 return f1(x) end
      end
    end
  }
  local foldableMaybe = {
    foldr = function(v_72)
      return function(v1_73)
        return function(v2_74)
          if "Data.Maybe.Nothing" == v2_74["$ctor"] then
            return (function() local z = v1_73 return z end)()
          else
            return (function()
              if "Data.Maybe.Just" == v2_74["$ctor"] then
                return (function()
                  local x = v2_74[0]
                  local z = v1_73
                  local f = v_72
                  return (f(x))(z)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end
      end
    end,
    foldl = function(v_75)
      return function(v1_76)
        return function(v2_77)
          if "Data.Maybe.Nothing" == v2_77["$ctor"] then
            return (function() local z = v1_76 return z end)()
          else
            return (function()
              if "Data.Maybe.Just" == v2_77["$ctor"] then
                return (function()
                  local x = v2_77[0]
                  local z = v1_76
                  local f = v_75
                  return (f(z))(x)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end
      end
    end,
    foldMap = function(dictMonoid_78)
      local mempty = Data_Monoid.mempty(dictMonoid_78)
      return function(v_79)
        return function(v1_80)
          return (function()
            if "Data.Maybe.Nothing" == v1_80["$ctor"] then
              return mempty
            else
              return (function()
                if "Data.Maybe.Just" == v1_80["$ctor"] then
                  return (function()
                    local x = v1_80[0]
                    local f = v_79
                    return f(x)
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end
      end
    end
  }
  local foldr1 = foldr(foldableMaybe)
  local foldl1 = foldl(foldableMaybe)
  local foldableIdentity = {
    foldr = function(f_81)
      return function(z_82)
        return function(v_83)
          local x = v_83
          local z1 = z_82
          local f1 = f_81
          return (f1(x))(z1)
        end
      end
    end,
    foldl = function(f_84)
      return function(z_85)
        return function(v_86)
          local x = v_86
          local z1 = z_85
          local f1 = f_84
          return (f1(z1))(x)
        end
      end
    end,
    foldMap = function(dictMonoid_87)
      return function(f_88)
        return function(v_89) local x = v_89 local f1 = f_88 return f1(x) end
      end
    end
  }
  local foldableEither = {
    foldr = function(v_90)
      return function(v1_91)
        return function(v2_92)
          if "Data.Either.Left" == v2_92["$ctor"] then
            return (function() local z = v1_91 return z end)()
          else
            return (function()
              if "Data.Either.Right" == v2_92["$ctor"] then
                return (function()
                  local x = v2_92[0]
                  local z = v1_91
                  local f = v_90
                  return (f(x))(z)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end
      end
    end,
    foldl = function(v_93)
      return function(v1_94)
        return function(v2_95)
          if "Data.Either.Left" == v2_95["$ctor"] then
            return (function() local z = v1_94 return z end)()
          else
            return (function()
              if "Data.Either.Right" == v2_95["$ctor"] then
                return (function()
                  local x = v2_95[0]
                  local z = v1_94
                  local f = v_93
                  return (f(z))(x)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end
      end
    end,
    foldMap = function(dictMonoid_96)
      local mempty = Data_Monoid.mempty(dictMonoid_96)
      return function(v_97)
        return function(v1_98)
          return (function()
            if "Data.Either.Left" == v1_98["$ctor"] then
              return mempty
            else
              return (function()
                if "Data.Either.Right" == v1_98["$ctor"] then
                  return (function()
                    local x = v1_98[0]
                    local f = v_97
                    return f(x)
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end
      end
    end
  }
  local foldableDual = {
    foldr = function(f_99)
      return function(z_100)
        return function(v_101)
          local x = v_101
          local z1 = z_100
          local f1 = f_99
          return (f1(x))(z1)
        end
      end
    end,
    foldl = function(f_102)
      return function(z_103)
        return function(v_104)
          local x = v_104
          local z1 = z_103
          local f1 = f_102
          return (f1(z1))(x)
        end
      end
    end,
    foldMap = function(dictMonoid_105)
      return function(f_106)
        return function(v_107) local x = v_107 local f1 = f_106 return f1(x) end
      end
    end
  }
  local foldableDisj = {
    foldr = function(f_108)
      return function(z_109)
        return function(v_110)
          local x = v_110
          local z1 = z_109
          local f1 = f_108
          return (f1(x))(z1)
        end
      end
    end,
    foldl = function(f_111)
      return function(z_112)
        return function(v_113)
          local x = v_113
          local z1 = z_112
          local f1 = f_111
          return (f1(z1))(x)
        end
      end
    end,
    foldMap = function(dictMonoid_114)
      return function(f_115)
        return function(v_116) local x = v_116 local f1 = f_115 return f1(x) end
      end
    end
  }
  local foldableConst = {
    foldr = function(v_117)
      return function(z_118) return function(v1_119) return z_118 end end
    end,
    foldl = function(v_120)
      return function(z_121) return function(v1_122) return z_121 end end
    end,
    foldMap = function(dictMonoid_123)
      local mempty = Data_Monoid.mempty(dictMonoid_123)
      return function(v_124) return function(v1_125) return mempty end end
    end
  }
  local foldableConj = {
    foldr = function(f_126)
      return function(z_127)
        return function(v_128)
          local x = v_128
          local z1 = z_127
          local f1 = f_126
          return (f1(x))(z1)
        end
      end
    end,
    foldl = function(f_129)
      return function(z_130)
        return function(v_131)
          local x = v_131
          local z1 = z_130
          local f1 = f_129
          return (f1(z1))(x)
        end
      end
    end,
    foldMap = function(dictMonoid_132)
      return function(f_133)
        return function(v_134) local x = v_134 local f1 = f_133 return f1(x) end
      end
    end
  }
  local foldableAdditive = {
    foldr = function(f_135)
      return function(z_136)
        return function(v_137)
          local x = v_137
          local z1 = z_136
          local f1 = f_135
          return (f1(x))(z1)
        end
      end
    end,
    foldl = function(f_138)
      return function(z_139)
        return function(v_140)
          local x = v_140
          local z1 = z_139
          local f1 = f_138
          return (f1(z1))(x)
        end
      end
    end,
    foldMap = function(dictMonoid_141)
      return function(f_142)
        return function(v_143) local x = v_143 local f1 = f_142 return f1(x) end
      end
    end
  }
  local foldMapDefaultR = function(dictFoldable_144)
    local foldr2 = foldr(dictFoldable_144)
    return function(dictMonoid_145)
      return (function()
        local append = Data_Semigroup.append(dictMonoid_145.Semigroup0(Prim.undefined))
        local mempty = Data_Monoid.mempty(dictMonoid_145)
        return function(f_146)
          return (foldr2(function(x_147)
            return function(acc_148) return (append(f_146(x_147)))(acc_148) end
          end))(mempty)
        end
      end)()
    end
  end
  local foldableArray
  foldableArray = {
    foldr = foldrArray,
    foldl = foldlArray,
    foldMap = function(dictMonoid_149)
      return (foldMapDefaultR(foldableArray))(dictMonoid_149)
    end
  }
  local foldMapDefaultL = function(dictFoldable_150)
    local foldl2 = foldl(dictFoldable_150)
    return function(dictMonoid_151)
      return (function()
        local append = Data_Semigroup.append(dictMonoid_151.Semigroup0(Prim.undefined))
        local mempty = Data_Monoid.mempty(dictMonoid_151)
        return function(f_152)
          return (foldl2(function(acc_153)
            return function(x_154) return (append(acc_153))(f_152(x_154)) end
          end))(mempty)
        end
      end)()
    end
  end
  local foldMap = function(dict_155) local v = dict_155 return v.foldMap end
  local foldMap1 = foldMap(foldableMaybe)
  local foldableApp = function(dictFoldable_156)
    local foldr2 = foldr(dictFoldable_156)
    local foldl2 = foldl(dictFoldable_156)
    local foldMap2 = foldMap(dictFoldable_156)
    return {
      foldr = function(f_157)
        return function(i_158)
          return function(v_159)
            return (function()
              local x = v_159
              local i1 = i_158
              local f1 = f_157
              return ((foldr2(f1))(i1))(x)
            end)()
          end
        end
      end,
      foldl = function(f_160)
        return function(i_161)
          return function(v_162)
            return (function()
              local x = v_162
              local i1 = i_161
              local f1 = f_160
              return ((foldl2(f1))(i1))(x)
            end)()
          end
        end
      end,
      foldMap = function(dictMonoid_163)
        return (function()
          local foldMap3 = foldMap2(dictMonoid_163)
          return function(f_164)
            return function(v_165)
              return (function()
                local x = v_165
                local f1 = f_164
                return (foldMap3(f1))(x)
              end)()
            end
          end
        end)()
      end
    }
  end
  local foldableCompose = function(dictFoldable_166)
    local foldr2 = foldr(dictFoldable_166)
    local foldl2 = foldl(dictFoldable_166)
    local foldMap2 = foldMap(dictFoldable_166)
    return function(dictFoldable1_167)
      return (function()
        local foldr3 = foldr(dictFoldable1_167)
        local foldl3 = foldl(dictFoldable1_167)
        local foldMap3 = foldMap(dictFoldable1_167)
        return {
          foldr = function(f_168)
            return function(i_169)
              return function(v_170)
                return (function()
                  local fga = v_170
                  local i1 = i_169
                  local f1 = f_168
                  return ((foldr2(Data_Function.flip(foldr3(f1))))(i1))(fga)
                end)()
              end
            end
          end,
          foldl = function(f_171)
            return function(i_172)
              return function(v_173)
                return (function()
                  local fga = v_173
                  local i1 = i_172
                  local f1 = f_171
                  return ((foldl2(foldl3(f1)))(i1))(fga)
                end)()
              end
            end
          end,
          foldMap = function(dictMonoid_174)
            return (function()
              local foldMap4 = foldMap2(dictMonoid_174)
              local foldMap5 = foldMap3(dictMonoid_174)
              return function(f_175)
                return function(v_176)
                  return (function()
                    local fga = v_176
                    local f1 = f_175
                    return (foldMap4(foldMap5(f1)))(fga)
                  end)()
                end
              end
            end)()
          end
        }
      end)()
    end
  end
  local foldableCoproduct = function(dictFoldable_177)
    local foldr2 = foldr(dictFoldable_177)
    local foldl2 = foldl(dictFoldable_177)
    local foldMap2 = foldMap(dictFoldable_177)
    return function(dictFoldable1_178)
      return (function()
        local foldr3 = foldr(dictFoldable1_178)
        local foldl3 = foldl(dictFoldable1_178)
        local foldMap3 = foldMap(dictFoldable1_178)
        return {
          foldr = function(f_179)
            return function(z_180)
              return (Data_Functor_Coproduct.coproduct((foldr2(f_179))(z_180)))((foldr3(f_179))(z_180))
            end
          end,
          foldl = function(f_181)
            return function(z_182)
              return (Data_Functor_Coproduct.coproduct((foldl2(f_181))(z_182)))((foldl3(f_181))(z_182))
            end
          end,
          foldMap = function(dictMonoid_183)
            return (function()
              local foldMap4 = foldMap2(dictMonoid_183)
              local foldMap5 = foldMap3(dictMonoid_183)
              return function(f_184)
                return (Data_Functor_Coproduct.coproduct(foldMap4(f_184)))(foldMap5(f_184))
              end
            end)()
          end
        }
      end)()
    end
  end
  local foldableFirst = {
    foldr = function(f_185)
      return function(z_186)
        return function(v_187)
          local x = v_187
          local z1 = z_186
          local f1 = f_185
          return ((foldr1(f1))(z1))(x)
        end
      end
    end,
    foldl = function(f_188)
      return function(z_189)
        return function(v_190)
          local x = v_190
          local z1 = z_189
          local f1 = f_188
          return ((foldl1(f1))(z1))(x)
        end
      end
    end,
    foldMap = function(dictMonoid_191)
      local foldMap2 = foldMap1(dictMonoid_191)
      return function(f_192)
        return function(v_193)
          return (function()
            local x = v_193
            local f1 = f_192
            return (foldMap2(f1))(x)
          end)()
        end
      end
    end
  }
  local foldableLast = {
    foldr = function(f_194)
      return function(z_195)
        return function(v_196)
          local x = v_196
          local z1 = z_195
          local f1 = f_194
          return ((foldr1(f1))(z1))(x)
        end
      end
    end,
    foldl = function(f_197)
      return function(z_198)
        return function(v_199)
          local x = v_199
          local z1 = z_198
          local f1 = f_197
          return ((foldl1(f1))(z1))(x)
        end
      end
    end,
    foldMap = function(dictMonoid_200)
      local foldMap2 = foldMap1(dictMonoid_200)
      return function(f_201)
        return function(v_202)
          return (function()
            local x = v_202
            local f1 = f_201
            return (foldMap2(f1))(x)
          end)()
        end
      end
    end
  }
  local foldableProduct = function(dictFoldable_203)
    local foldr2 = foldr(dictFoldable_203)
    local foldl2 = foldl(dictFoldable_203)
    local foldMap2 = foldMap(dictFoldable_203)
    return function(dictFoldable1_204)
      return (function()
        local foldr3 = foldr(dictFoldable1_204)
        local foldl3 = foldl(dictFoldable1_204)
        local foldMap3 = foldMap(dictFoldable1_204)
        return {
          foldr = function(f_205)
            return function(z_206)
              return function(v_207)
                return (function()
                  if "Data.Tuple.Tuple" == v_207["$ctor"] then
                    return (function()
                      local ga = v_207[1]
                      local fa = v_207[0]
                      local z1 = z_206
                      local f1 = f_205
                      return ((foldr2(f1))(((foldr3(f1))(z1))(ga)))(fa)
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end
          end,
          foldl = function(f_208)
            return function(z_209)
              return function(v_210)
                return (function()
                  if "Data.Tuple.Tuple" == v_210["$ctor"] then
                    return (function()
                      local ga = v_210[1]
                      local fa = v_210[0]
                      local z1 = z_209
                      local f1 = f_208
                      return ((foldl3(f1))(((foldl2(f1))(z1))(fa)))(ga)
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end
          end,
          foldMap = function(dictMonoid_211)
            return (function()
              local append = Data_Semigroup.append(dictMonoid_211.Semigroup0(Prim.undefined))
              local foldMap4 = foldMap2(dictMonoid_211)
              local foldMap5 = foldMap3(dictMonoid_211)
              return function(f_212)
                return function(v_213)
                  return (function()
                    if "Data.Tuple.Tuple" == v_213["$ctor"] then
                      return (function()
                        local ga = v_213[1]
                        local fa = v_213[0]
                        local f1 = f_212
                        return (append((foldMap4(f1))(fa)))((foldMap5(f1))(ga))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end
            end)()
          end
        }
      end)()
    end
  end
  local foldlDefault = function(dictFoldable_214)
    local foldMap2 = (foldMap(dictFoldable_214))(monoidDual)
    return function(c_215)
      return function(u_216)
        return function(xs_217)
          return (unwrap(unwrap((foldMap2((compose(Data_Monoid_Dual.Dual))((compose(Data_Monoid_Endo.Endo))(Data_Function.flip(c_215)))))(xs_217))))(u_216)
        end
      end
    end
  end
  local foldrDefault = function(dictFoldable_218)
    local foldMap2 = (foldMap(dictFoldable_218))(monoidEndo)
    return function(c_219)
      return function(u_220)
        return function(xs_221)
          return (unwrap((foldMap2((compose(Data_Monoid_Endo.Endo))(c_219)))(xs_221)))(u_220)
        end
      end
    end
  end
  local lookup = function(dictFoldable_222)
    local foldMap2 = (foldMap(dictFoldable_222))(Data_Maybe_First.monoidFirst)
    return function(dictEq_223)
      return (function()
        local eq2 = Data_Eq.eq(dictEq_223)
        return function(a_224)
          return (compose(unwrap))(foldMap2(function(v_225)
            return (function()
              if "Data.Tuple.Tuple" == v_225["$ctor"] then
                return (function()
                  local b = v_225[1]
                  local aPrime = v_225[0]
                  return (function()
                    local e62 = (eq2(a_224))(aPrime)
                    return (function()
                      if true == e62 then
                        return Data_Maybe.Just(b)
                      else
                        return Data_Maybe.Nothing
                      end
                    end)()
                  end)()
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end))
        end
      end)()
    end
  end
  local surroundMap = function(dictFoldable_226)
    local foldMap2 = (foldMap(dictFoldable_226))(monoidEndo)
    return function(dictSemigroup_227)
      return (function()
        local append = Data_Semigroup.append(dictSemigroup_227)
        return function(d_228)
          return function(t_229)
            return function(f_230)
              return (function()
                local joined = function(a_231)
                  return function(m_232)
                    return (append(d_228))((append(t_229(a_231)))(m_232))
                  end
                end
                return (unwrap((foldMap2(joined))(f_230)))(d_228)
              end)()
            end
          end
        end
      end)()
    end
  end
  local surround = function(dictFoldable_233)
    local surroundMap1 = surroundMap(dictFoldable_233)
    return function(dictSemigroup_234)
      return (function()
        local surroundMap2 = surroundMap1(dictSemigroup_234)
        return function(d_235) return (surroundMap2(d_235))(identity) end
      end)()
    end
  end
  local foldM = function(dictFoldable_236)
    local foldl2 = foldl(dictFoldable_236)
    return function(dictMonad_237)
      return (function()
        local bind = Control_Bind.bind(dictMonad_237.Bind1(Prim.undefined))
        local pure = Control_Applicative.pure(dictMonad_237.Applicative0(Prim.undefined))
        return function(f_238)
          return function(b0_239)
            return (foldl2(function(b_240)
              return function(a_241)
                return (bind(b_240))((Data_Function.flip(f_238))(a_241))
              end
            end))(pure(b0_239))
          end
        end
      end)()
    end
  end
  local fold = function(dictFoldable_242)
    local foldMap2 = foldMap(dictFoldable_242)
    return function(dictMonoid_243)
      return (foldMap2(dictMonoid_243))(identity)
    end
  end
  local findMap = function(dictFoldable_244)
    local foldl2 = foldl(dictFoldable_244)
    return function(p_245)
      return (function()
        local go = function(v_246)
          return function(v1_247)
            return (function()
              if "Data.Maybe.Nothing" == v_246["$ctor"] then
                return (function() local x = v1_247 return p_245(x) end)()
              else
                return (function() local r = v_246 return r end)()
              end
            end)()
          end
        end
        return (foldl2(go))(Data_Maybe.Nothing)
      end)()
    end
  end
  local find = function(dictFoldable_248)
    local foldl2 = foldl(dictFoldable_248)
    return function(p_249)
      return (function()
        local go = function(v_250)
          return function(v1_251)
            return (function()
              if "Data.Maybe.Nothing" == v_250["$ctor"] then
                return (function()
                  local n67 = (function() local r = v_250 return r end)()
                  local x = v1_251
                  return (function()
                    if p_249(x) then
                      return Data_Maybe.Just(x)
                    else
                      return n67
                    end
                  end)()
                end)()
              else
                return (function() local r = v_250 return r end)()
              end
            end)()
          end
        end
        return (foldl2(go))(Data_Maybe.Nothing)
      end)()
    end
  end
  local any = function(dictFoldable_252)
    local foldMap2 = foldMap(dictFoldable_252)
    return function(dictHeytingAlgebra_253)
      return (alaF(Data_Monoid_Disj.Disj))(foldMap2(Data_Monoid_Disj.monoidDisj(dictHeytingAlgebra_253)))
    end
  end
  local elem = function(dictFoldable_254)
    local any1 = (any(dictFoldable_254))(Data_HeytingAlgebra.heytingAlgebraBoolean)
    return function(dictEq_255)
      return (compose(any1))(Data_Eq.eq(dictEq_255))
    end
  end
  local notElem = function(dictFoldable_256)
    local elem1 = elem(dictFoldable_256)
    return function(dictEq_257)
      return (function()
        local elem2 = elem1(dictEq_257)
        return function(x_258) return (compose(_not_))(elem2(x_258)) end
      end)()
    end
  end
  local _or_ = function(dictFoldable_259)
    local any1 = any(dictFoldable_259)
    return function(dictHeytingAlgebra_260)
      return (any1(dictHeytingAlgebra_260))(identity)
    end
  end
  local all = function(dictFoldable_261)
    local foldMap2 = foldMap(dictFoldable_261)
    return function(dictHeytingAlgebra_262)
      return (alaF(Data_Monoid_Conj.Conj))(foldMap2(Data_Monoid_Conj.monoidConj(dictHeytingAlgebra_262)))
    end
  end
  local _and_ = function(dictFoldable_263)
    local all1 = all(dictFoldable_263)
    return function(dictHeytingAlgebra_264)
      return (all1(dictHeytingAlgebra_264))(identity)
    end
  end
  return {
    foldr = foldr,
    foldl = foldl,
    foldMap = foldMap,
    foldrDefault = foldrDefault,
    foldlDefault = foldlDefault,
    foldMapDefaultL = foldMapDefaultL,
    foldMapDefaultR = foldMapDefaultR,
    fold = fold,
    foldM = foldM,
    traverse_ = traverse_,
    for_ = for_,
    sequence_ = sequence_,
    oneOf = oneOf,
    oneOfMap = oneOfMap,
    intercalate = intercalate,
    surroundMap = surroundMap,
    surround = surround,
    _and_ = _and_,
    _or_ = _or_,
    all = all,
    any = any,
    sum = sum,
    product = product,
    elem = elem,
    notElem = notElem,
    indexl = indexl,
    indexr = indexr,
    find = find,
    findMap = findMap,
    maximum = maximum,
    maximumBy = maximumBy,
    minimum = minimum,
    minimumBy = minimumBy,
    null = null,
    length = length,
    lookup = lookup,
    foldableArray = foldableArray,
    foldableMaybe = foldableMaybe,
    foldableFirst = foldableFirst,
    foldableLast = foldableLast,
    foldableAdditive = foldableAdditive,
    foldableDual = foldableDual,
    foldableDisj = foldableDisj,
    foldableConj = foldableConj,
    foldableMultiplicative = foldableMultiplicative,
    foldableEither = foldableEither,
    foldableTuple = foldableTuple,
    foldableIdentity = foldableIdentity,
    foldableConst = foldableConst,
    foldableProduct = foldableProduct,
    foldableCoproduct = foldableCoproduct,
    foldableCompose = foldableCompose,
    foldableApp = foldableApp
  }
end)()
local Data_FunctorWithIndex = (function()
  local foreign = (function()
    return {
        mapWithIndexArray = function(f)
            return function(xs)
                local l = #xs
                local result = {}
                for i = 1, l do
                    result[i] = f(i)(xs[i])
                end
                return result
            end
        end
    }

  end)()
  local mapWithIndexArray = foreign.mapWithIndexArray
  local map = Data_Functor.map(Data_Tuple.functorTuple)
  local bimap = Data_Bifunctor.bimap(Data_Bifunctor.bifunctorTuple)
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local map1 = Data_Functor.map(Data_Monoid_Multiplicative.functorMultiplicative)
  local map2 = Data_Functor.map(Data_Maybe.functorMaybe)
  local map3 = Data_Functor.map(Data_Maybe_Last.functorLast)
  local map4 = Data_Functor.map(Data_Maybe_First.functorFirst)
  local map5 = Data_Functor.map(Data_Either.functorEither)
  local map6 = Data_Functor.map(Data_Monoid_Dual.functorDual)
  local map7 = Data_Functor.map(Data_Monoid_Disj.functorDisj)
  local bimap1 = Data_Bifunctor.bimap(Data_Bifunctor.bifunctorEither)
  local map8 = Data_Functor.map(Data_Monoid_Conj.functorConj)
  local map9 = Data_Functor.map(Data_Monoid_Additive.functorAdditive)
  local FunctorWithIndex_S_Dict = function(x_0) return x_0 end
  local mapWithIndex = function(dict_1)
    local v = dict_1
    return v.mapWithIndex
  end
  local mapDefault = function(dictFunctorWithIndex_2)
    local mapWithIndex1 = mapWithIndex(dictFunctorWithIndex_2)
    return function(f_3) return mapWithIndex1(Data_Function.const(f_3)) end
  end
  local functorWithIndexTuple = {
    mapWithIndex = function(f_4) return map(f_4(Data_Unit.unit)) end,
    Functor0 = function() return Data_Tuple.functorTuple end
  }
  local functorWithIndexProduct = function(dictFunctorWithIndex_5)
    local mapWithIndex1 = mapWithIndex(dictFunctorWithIndex_5)
    local functorProduct = Data_Functor_Product.functorProduct(dictFunctorWithIndex_5.Functor0(Prim.undefined))
    return function(dictFunctorWithIndex1_6)
      return (function()
        local mapWithIndex2 = mapWithIndex(dictFunctorWithIndex1_6)
        local functorProduct1 = functorProduct(dictFunctorWithIndex1_6.Functor0(Prim.undefined))
        return {
          mapWithIndex = function(f_7)
            return function(v_8)
              return (function()
                local fga = v_8
                local f1 = f_7
                return ((bimap(mapWithIndex1((compose(f1))(Data_Either.Left))))(mapWithIndex2((compose(f1))(Data_Either.Right))))(fga)
              end)()
            end
          end,
          Functor0 = function() return functorProduct1 end
        }
      end)()
    end
  end
  local functorWithIndexMultiplicative = {
    mapWithIndex = function(f_9) return map1(f_9(Data_Unit.unit)) end,
    Functor0 = function()
      return Data_Monoid_Multiplicative.functorMultiplicative
    end
  }
  local functorWithIndexMaybe = {
    mapWithIndex = function(f_10) return map2(f_10(Data_Unit.unit)) end,
    Functor0 = function() return Data_Maybe.functorMaybe end
  }
  local functorWithIndexLast = {
    mapWithIndex = function(f_11) return map3(f_11(Data_Unit.unit)) end,
    Functor0 = function() return Data_Maybe_Last.functorLast end
  }
  local functorWithIndexIdentity = {
    mapWithIndex = function(f_12)
      return function(v_13)
        local a = v_13
        local f1 = f_12
        return (f1(Data_Unit.unit))(a)
      end
    end,
    Functor0 = function() return Data_Identity.functorIdentity end
  }
  local functorWithIndexFirst = {
    mapWithIndex = function(f_14) return map4(f_14(Data_Unit.unit)) end,
    Functor0 = function() return Data_Maybe_First.functorFirst end
  }
  local functorWithIndexEither = {
    mapWithIndex = function(f_15) return map5(f_15(Data_Unit.unit)) end,
    Functor0 = function() return Data_Either.functorEither end
  }
  local functorWithIndexDual = {
    mapWithIndex = function(f_16) return map6(f_16(Data_Unit.unit)) end,
    Functor0 = function() return Data_Monoid_Dual.functorDual end
  }
  local functorWithIndexDisj = {
    mapWithIndex = function(f_17) return map7(f_17(Data_Unit.unit)) end,
    Functor0 = function() return Data_Monoid_Disj.functorDisj end
  }
  local functorWithIndexCoproduct = function(dictFunctorWithIndex_18)
    local mapWithIndex1 = mapWithIndex(dictFunctorWithIndex_18)
    local functorCoproduct = Data_Functor_Coproduct.functorCoproduct(dictFunctorWithIndex_18.Functor0(Prim.undefined))
    return function(dictFunctorWithIndex1_19)
      return (function()
        local mapWithIndex2 = mapWithIndex(dictFunctorWithIndex1_19)
        local functorCoproduct1 = functorCoproduct(dictFunctorWithIndex1_19.Functor0(Prim.undefined))
        return {
          mapWithIndex = function(f_20)
            return function(v_21)
              return (function()
                local e = v_21
                local f1 = f_20
                return ((bimap1(mapWithIndex1((compose(f1))(Data_Either.Left))))(mapWithIndex2((compose(f1))(Data_Either.Right))))(e)
              end)()
            end
          end,
          Functor0 = function() return functorCoproduct1 end
        }
      end)()
    end
  end
  local functorWithIndexConst = {
    mapWithIndex = function(v_22)
      return function(v1_23) local x = v1_23 return x end
    end,
    Functor0 = function() return Data_Const.functorConst end
  }
  local functorWithIndexConj = {
    mapWithIndex = function(f_24) return map8(f_24(Data_Unit.unit)) end,
    Functor0 = function() return Data_Monoid_Conj.functorConj end
  }
  local functorWithIndexCompose = function(dictFunctorWithIndex_25)
    local mapWithIndex1 = mapWithIndex(dictFunctorWithIndex_25)
    local functorCompose = Data_Functor_Compose.functorCompose(dictFunctorWithIndex_25.Functor0(Prim.undefined))
    return function(dictFunctorWithIndex1_26)
      return (function()
        local mapWithIndex2 = mapWithIndex(dictFunctorWithIndex1_26)
        local functorCompose1 = functorCompose(dictFunctorWithIndex1_26.Functor0(Prim.undefined))
        return {
          mapWithIndex = function(f_27)
            return function(v_28)
              return (function()
                local fga = v_28
                local f1 = f_27
                return (mapWithIndex1((compose(mapWithIndex2))(Data_Tuple.curry(f1))))(fga)
              end)()
            end
          end,
          Functor0 = function() return functorCompose1 end
        }
      end)()
    end
  end
  local functorWithIndexArray = {
    mapWithIndex = mapWithIndexArray,
    Functor0 = function() return Data_Functor.functorArray end
  }
  local functorWithIndexApp = function(dictFunctorWithIndex_29)
    local mapWithIndex1 = mapWithIndex(dictFunctorWithIndex_29)
    local functorApp = Data_Functor_App.functorApp(dictFunctorWithIndex_29.Functor0(Prim.undefined))
    return {
      mapWithIndex = function(f_30)
        return function(v_31)
          return (function()
            local x = v_31
            local f1 = f_30
            return (mapWithIndex1(f1))(x)
          end)()
        end
      end,
      Functor0 = function() return functorApp end
    }
  end
  local functorWithIndexAdditive = {
    mapWithIndex = function(f_32) return map9(f_32(Data_Unit.unit)) end,
    Functor0 = function() return Data_Monoid_Additive.functorAdditive end
  }
  return {
    mapWithIndex = mapWithIndex,
    mapDefault = mapDefault,
    functorWithIndexArray = functorWithIndexArray,
    functorWithIndexMaybe = functorWithIndexMaybe,
    functorWithIndexFirst = functorWithIndexFirst,
    functorWithIndexLast = functorWithIndexLast,
    functorWithIndexAdditive = functorWithIndexAdditive,
    functorWithIndexDual = functorWithIndexDual,
    functorWithIndexConj = functorWithIndexConj,
    functorWithIndexDisj = functorWithIndexDisj,
    functorWithIndexMultiplicative = functorWithIndexMultiplicative,
    functorWithIndexEither = functorWithIndexEither,
    functorWithIndexTuple = functorWithIndexTuple,
    functorWithIndexIdentity = functorWithIndexIdentity,
    functorWithIndexConst = functorWithIndexConst,
    functorWithIndexProduct = functorWithIndexProduct,
    functorWithIndexCoproduct = functorWithIndexCoproduct,
    functorWithIndexCompose = functorWithIndexCompose,
    functorWithIndexApp = functorWithIndexApp
  }
end)()
local Data_FoldableWithIndex = (function()
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local foldr = Data_Foldable.foldr(Data_Foldable.foldableMultiplicative)
  local foldl = Data_Foldable.foldl(Data_Foldable.foldableMultiplicative)
  local foldMap = Data_Foldable.foldMap(Data_Foldable.foldableMultiplicative)
  local foldr1 = Data_Foldable.foldr(Data_Foldable.foldableMaybe)
  local foldl1 = Data_Foldable.foldl(Data_Foldable.foldableMaybe)
  local foldMap1 = Data_Foldable.foldMap(Data_Foldable.foldableMaybe)
  local foldr2 = Data_Foldable.foldr(Data_Foldable.foldableLast)
  local foldl2 = Data_Foldable.foldl(Data_Foldable.foldableLast)
  local foldMap2 = Data_Foldable.foldMap(Data_Foldable.foldableLast)
  local foldr3 = Data_Foldable.foldr(Data_Foldable.foldableFirst)
  local foldl3 = Data_Foldable.foldl(Data_Foldable.foldableFirst)
  local foldMap3 = Data_Foldable.foldMap(Data_Foldable.foldableFirst)
  local foldr4 = Data_Foldable.foldr(Data_Foldable.foldableDual)
  local foldl4 = Data_Foldable.foldl(Data_Foldable.foldableDual)
  local foldMap4 = Data_Foldable.foldMap(Data_Foldable.foldableDual)
  local foldr5 = Data_Foldable.foldr(Data_Foldable.foldableDisj)
  local foldl5 = Data_Foldable.foldl(Data_Foldable.foldableDisj)
  local foldMap5 = Data_Foldable.foldMap(Data_Foldable.foldableDisj)
  local foldr6 = Data_Foldable.foldr(Data_Foldable.foldableConj)
  local foldl6 = Data_Foldable.foldl(Data_Foldable.foldableConj)
  local foldMap6 = Data_Foldable.foldMap(Data_Foldable.foldableConj)
  local foldr7 = Data_Foldable.foldr(Data_Foldable.foldableAdditive)
  local foldl7 = Data_Foldable.foldl(Data_Foldable.foldableAdditive)
  local foldMap7 = Data_Foldable.foldMap(Data_Foldable.foldableAdditive)
  local foldr8 = Data_Foldable.foldr(Data_Foldable.foldableArray)
  local mapWithIndex = Data_FunctorWithIndex.mapWithIndex(Data_FunctorWithIndex.functorWithIndexArray)
  local foldl8 = Data_Foldable.foldl(Data_Foldable.foldableArray)
  local unwrap = Data_Newtype.unwrap(Prim.undefined)
  local monoidEndo = Data_Monoid_Endo.monoidEndo(Control_Category.categoryFn)
  local monoidDual = Data_Monoid_Dual.monoidDual(monoidEndo)
  local FoldableWithIndex_S_Dict = function(x_0) return x_0 end
  local foldrWithIndex = function(dict_1)
    local v = dict_1
    return v.foldrWithIndex
  end
  local traverseWithIndex_ = function(dictApplicative_2)
    local applySecond = Control_Apply.applySecond(dictApplicative_2.Apply0(Prim.undefined))
    local pure = Control_Applicative.pure(dictApplicative_2)
    return function(dictFoldableWithIndex_3)
      return (function()
        local foldrWithIndex1 = foldrWithIndex(dictFoldableWithIndex_3)
        return function(f_4)
          return (foldrWithIndex1(function(i_5)
            return (compose(applySecond))(f_4(i_5))
          end))(pure(Data_Unit.unit))
        end
      end)()
    end
  end
  local forWithIndex_ = function(dictApplicative_6)
    local traverseWithIndex_1 = traverseWithIndex_(dictApplicative_6)
    return function(dictFoldableWithIndex_7)
      return Data_Function.flip(traverseWithIndex_1(dictFoldableWithIndex_7))
    end
  end
  local foldrDefault = function(dictFoldableWithIndex_8)
    local foldrWithIndex1 = foldrWithIndex(dictFoldableWithIndex_8)
    return function(f_9) return foldrWithIndex1(Data_Function.const(f_9)) end
  end
  local foldlWithIndex = function(dict_10)
    local v = dict_10
    return v.foldlWithIndex
  end
  local foldlDefault = function(dictFoldableWithIndex_11)
    local foldlWithIndex1 = foldlWithIndex(dictFoldableWithIndex_11)
    return function(f_12) return foldlWithIndex1(Data_Function.const(f_12)) end
  end
  local foldableWithIndexTuple = {
    foldrWithIndex = function(f_13)
      return function(z_14)
        return function(v_15)
          if "Data.Tuple.Tuple" == v_15["$ctor"] then
            return (function()
              local x = v_15[1]
              local z1 = z_14
              local f1 = f_13
              return ((f1(Data_Unit.unit))(x))(z1)
            end)()
          else
            return error("No patterns matched")
          end
        end
      end
    end,
    foldlWithIndex = function(f_16)
      return function(z_17)
        return function(v_18)
          if "Data.Tuple.Tuple" == v_18["$ctor"] then
            return (function()
              local x = v_18[1]
              local z1 = z_17
              local f1 = f_16
              return ((f1(Data_Unit.unit))(z1))(x)
            end)()
          else
            return error("No patterns matched")
          end
        end
      end
    end,
    foldMapWithIndex = function(dictMonoid_19)
      return function(f_20)
        return function(v_21)
          if "Data.Tuple.Tuple" == v_21["$ctor"] then
            return (function()
              local x = v_21[1]
              local f1 = f_20
              return (f1(Data_Unit.unit))(x)
            end)()
          else
            return error("No patterns matched")
          end
        end
      end
    end,
    Foldable0 = function() return Data_Foldable.foldableTuple end
  }
  local foldableWithIndexMultiplicative = {
    foldrWithIndex = function(f_22) return foldr(f_22(Data_Unit.unit)) end,
    foldlWithIndex = function(f_23) return foldl(f_23(Data_Unit.unit)) end,
    foldMapWithIndex = function(dictMonoid_24)
      local foldMap8 = foldMap(dictMonoid_24)
      return function(f_25) return foldMap8(f_25(Data_Unit.unit)) end
    end,
    Foldable0 = function() return Data_Foldable.foldableMultiplicative end
  }
  local foldableWithIndexMaybe = {
    foldrWithIndex = function(f_26) return foldr1(f_26(Data_Unit.unit)) end,
    foldlWithIndex = function(f_27) return foldl1(f_27(Data_Unit.unit)) end,
    foldMapWithIndex = function(dictMonoid_28)
      local foldMap8 = foldMap1(dictMonoid_28)
      return function(f_29) return foldMap8(f_29(Data_Unit.unit)) end
    end,
    Foldable0 = function() return Data_Foldable.foldableMaybe end
  }
  local foldableWithIndexLast = {
    foldrWithIndex = function(f_30) return foldr2(f_30(Data_Unit.unit)) end,
    foldlWithIndex = function(f_31) return foldl2(f_31(Data_Unit.unit)) end,
    foldMapWithIndex = function(dictMonoid_32)
      local foldMap8 = foldMap2(dictMonoid_32)
      return function(f_33) return foldMap8(f_33(Data_Unit.unit)) end
    end,
    Foldable0 = function() return Data_Foldable.foldableLast end
  }
  local foldableWithIndexIdentity = {
    foldrWithIndex = function(f_34)
      return function(z_35)
        return function(v_36)
          local x = v_36
          local z1 = z_35
          local f1 = f_34
          return ((f1(Data_Unit.unit))(x))(z1)
        end
      end
    end,
    foldlWithIndex = function(f_37)
      return function(z_38)
        return function(v_39)
          local x = v_39
          local z1 = z_38
          local f1 = f_37
          return ((f1(Data_Unit.unit))(z1))(x)
        end
      end
    end,
    foldMapWithIndex = function(dictMonoid_40)
      return function(f_41)
        return function(v_42)
          local x = v_42
          local f1 = f_41
          return (f1(Data_Unit.unit))(x)
        end
      end
    end,
    Foldable0 = function() return Data_Foldable.foldableIdentity end
  }
  local foldableWithIndexFirst = {
    foldrWithIndex = function(f_43) return foldr3(f_43(Data_Unit.unit)) end,
    foldlWithIndex = function(f_44) return foldl3(f_44(Data_Unit.unit)) end,
    foldMapWithIndex = function(dictMonoid_45)
      local foldMap8 = foldMap3(dictMonoid_45)
      return function(f_46) return foldMap8(f_46(Data_Unit.unit)) end
    end,
    Foldable0 = function() return Data_Foldable.foldableFirst end
  }
  local foldableWithIndexEither = {
    foldrWithIndex = function(v_47)
      return function(v1_48)
        return function(v2_49)
          if "Data.Either.Left" == v2_49["$ctor"] then
            return (function() local z = v1_48 return z end)()
          else
            return (function()
              if "Data.Either.Right" == v2_49["$ctor"] then
                return (function()
                  local x = v2_49[0]
                  local z = v1_48
                  local f = v_47
                  return ((f(Data_Unit.unit))(x))(z)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end
      end
    end,
    foldlWithIndex = function(v_50)
      return function(v1_51)
        return function(v2_52)
          if "Data.Either.Left" == v2_52["$ctor"] then
            return (function() local z = v1_51 return z end)()
          else
            return (function()
              if "Data.Either.Right" == v2_52["$ctor"] then
                return (function()
                  local x = v2_52[0]
                  local z = v1_51
                  local f = v_50
                  return ((f(Data_Unit.unit))(z))(x)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end
      end
    end,
    foldMapWithIndex = function(dictMonoid_53)
      local mempty = Data_Monoid.mempty(dictMonoid_53)
      return function(v_54)
        return function(v1_55)
          return (function()
            if "Data.Either.Left" == v1_55["$ctor"] then
              return mempty
            else
              return (function()
                if "Data.Either.Right" == v1_55["$ctor"] then
                  return (function()
                    local x = v1_55[0]
                    local f = v_54
                    return (f(Data_Unit.unit))(x)
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end
      end
    end,
    Foldable0 = function() return Data_Foldable.foldableEither end
  }
  local foldableWithIndexDual = {
    foldrWithIndex = function(f_56) return foldr4(f_56(Data_Unit.unit)) end,
    foldlWithIndex = function(f_57) return foldl4(f_57(Data_Unit.unit)) end,
    foldMapWithIndex = function(dictMonoid_58)
      local foldMap8 = foldMap4(dictMonoid_58)
      return function(f_59) return foldMap8(f_59(Data_Unit.unit)) end
    end,
    Foldable0 = function() return Data_Foldable.foldableDual end
  }
  local foldableWithIndexDisj = {
    foldrWithIndex = function(f_60) return foldr5(f_60(Data_Unit.unit)) end,
    foldlWithIndex = function(f_61) return foldl5(f_61(Data_Unit.unit)) end,
    foldMapWithIndex = function(dictMonoid_62)
      local foldMap8 = foldMap5(dictMonoid_62)
      return function(f_63) return foldMap8(f_63(Data_Unit.unit)) end
    end,
    Foldable0 = function() return Data_Foldable.foldableDisj end
  }
  local foldableWithIndexConst = {
    foldrWithIndex = function(v_64)
      return function(z_65) return function(v1_66) return z_65 end end
    end,
    foldlWithIndex = function(v_67)
      return function(z_68) return function(v1_69) return z_68 end end
    end,
    foldMapWithIndex = function(dictMonoid_70)
      local mempty = Data_Monoid.mempty(dictMonoid_70)
      return function(v_71) return function(v1_72) return mempty end end
    end,
    Foldable0 = function() return Data_Foldable.foldableConst end
  }
  local foldableWithIndexConj = {
    foldrWithIndex = function(f_73) return foldr6(f_73(Data_Unit.unit)) end,
    foldlWithIndex = function(f_74) return foldl6(f_74(Data_Unit.unit)) end,
    foldMapWithIndex = function(dictMonoid_75)
      local foldMap8 = foldMap6(dictMonoid_75)
      return function(f_76) return foldMap8(f_76(Data_Unit.unit)) end
    end,
    Foldable0 = function() return Data_Foldable.foldableConj end
  }
  local foldableWithIndexAdditive = {
    foldrWithIndex = function(f_77) return foldr7(f_77(Data_Unit.unit)) end,
    foldlWithIndex = function(f_78) return foldl7(f_78(Data_Unit.unit)) end,
    foldMapWithIndex = function(dictMonoid_79)
      local foldMap8 = foldMap7(dictMonoid_79)
      return function(f_80) return foldMap8(f_80(Data_Unit.unit)) end
    end,
    Foldable0 = function() return Data_Foldable.foldableAdditive end
  }
  local foldWithIndexM = function(dictFoldableWithIndex_81)
    local foldlWithIndex1 = foldlWithIndex(dictFoldableWithIndex_81)
    return function(dictMonad_82)
      return (function()
        local bind = Control_Bind.bind(dictMonad_82.Bind1(Prim.undefined))
        local pure = Control_Applicative.pure(dictMonad_82.Applicative0(Prim.undefined))
        return function(f_83)
          return function(a0_84)
            return (foldlWithIndex1(function(i_85)
              return function(ma_86)
                return function(b_87)
                  return (bind(ma_86))((Data_Function.flip(f_83(i_85)))(b_87))
                end
              end
            end))(pure(a0_84))
          end
        end
      end)()
    end
  end
  local foldMapWithIndexDefaultR = function(dictFoldableWithIndex_88)
    local foldrWithIndex1 = foldrWithIndex(dictFoldableWithIndex_88)
    return function(dictMonoid_89)
      return (function()
        local append = Data_Semigroup.append(dictMonoid_89.Semigroup0(Prim.undefined))
        local mempty = Data_Monoid.mempty(dictMonoid_89)
        return function(f_90)
          return (foldrWithIndex1(function(i_91)
            return function(x_92)
              return function(acc_93)
                return (append((f_90(i_91))(x_92)))(acc_93)
              end
            end
          end))(mempty)
        end
      end)()
    end
  end
  local foldableWithIndexArray
  foldableWithIndexArray = {
    foldrWithIndex = function(f_94)
      return function(z_95)
        return (compose((foldr8(function(v_96)
          return (function()
            if "Data.Tuple.Tuple" == v_96["$ctor"] then
              return (function()
                local x = v_96[1]
                local i = v_96[0]
                return function(y_97) return ((f_94(i))(x))(y_97) end
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end))(z_95)))(mapWithIndex(Data_Tuple.Tuple))
      end
    end,
    foldlWithIndex = function(f_98)
      return function(z_99)
        return (compose((foldl8(function(y_100)
          return function(v_101)
            return (function()
              if "Data.Tuple.Tuple" == v_101["$ctor"] then
                return (function()
                  local x = v_101[1]
                  local i = v_101[0]
                  return ((f_98(i))(y_100))(x)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end))(z_99)))(mapWithIndex(Data_Tuple.Tuple))
      end
    end,
    foldMapWithIndex = function(dictMonoid_102)
      return (foldMapWithIndexDefaultR(foldableWithIndexArray))(dictMonoid_102)
    end,
    Foldable0 = function() return Data_Foldable.foldableArray end
  }
  local foldMapWithIndexDefaultL = function(dictFoldableWithIndex_103)
    local foldlWithIndex1 = foldlWithIndex(dictFoldableWithIndex_103)
    return function(dictMonoid_104)
      return (function()
        local append = Data_Semigroup.append(dictMonoid_104.Semigroup0(Prim.undefined))
        local mempty = Data_Monoid.mempty(dictMonoid_104)
        return function(f_105)
          return (foldlWithIndex1(function(i_106)
            return function(acc_107)
              return function(x_108)
                return (append(acc_107))((f_105(i_106))(x_108))
              end
            end
          end))(mempty)
        end
      end)()
    end
  end
  local foldMapWithIndex = function(dict_109)
    local v = dict_109
    return v.foldMapWithIndex
  end
  local foldableWithIndexApp = function(dictFoldableWithIndex_110)
    local foldrWithIndex1 = foldrWithIndex(dictFoldableWithIndex_110)
    local foldlWithIndex1 = foldlWithIndex(dictFoldableWithIndex_110)
    local foldMapWithIndex1 = foldMapWithIndex(dictFoldableWithIndex_110)
    local foldableApp = Data_Foldable.foldableApp(dictFoldableWithIndex_110.Foldable0(Prim.undefined))
    return {
      foldrWithIndex = function(f_111)
        return function(z_112)
          return function(v_113)
            return (function()
              local x = v_113
              local z1 = z_112
              local f1 = f_111
              return ((foldrWithIndex1(f1))(z1))(x)
            end)()
          end
        end
      end,
      foldlWithIndex = function(f_114)
        return function(z_115)
          return function(v_116)
            return (function()
              local x = v_116
              local z1 = z_115
              local f1 = f_114
              return ((foldlWithIndex1(f1))(z1))(x)
            end)()
          end
        end
      end,
      foldMapWithIndex = function(dictMonoid_117)
        return (function()
          local foldMapWithIndex2 = foldMapWithIndex1(dictMonoid_117)
          return function(f_118)
            return function(v_119)
              return (function()
                local x = v_119
                local f1 = f_118
                return (foldMapWithIndex2(f1))(x)
              end)()
            end
          end
        end)()
      end,
      Foldable0 = function() return foldableApp end
    }
  end
  local foldableWithIndexCompose = function(dictFoldableWithIndex_120)
    local foldrWithIndex1 = foldrWithIndex(dictFoldableWithIndex_120)
    local foldlWithIndex1 = foldlWithIndex(dictFoldableWithIndex_120)
    local foldMapWithIndex1 = foldMapWithIndex(dictFoldableWithIndex_120)
    local foldableCompose = Data_Foldable.foldableCompose(dictFoldableWithIndex_120.Foldable0(Prim.undefined))
    return function(dictFoldableWithIndex1_121)
      return (function()
        local foldrWithIndex2 = foldrWithIndex(dictFoldableWithIndex1_121)
        local foldlWithIndex2 = foldlWithIndex(dictFoldableWithIndex1_121)
        local foldMapWithIndex2 = foldMapWithIndex(dictFoldableWithIndex1_121)
        local foldableCompose1 = foldableCompose(dictFoldableWithIndex1_121.Foldable0(Prim.undefined))
        return {
          foldrWithIndex = function(f_122)
            return function(i_123)
              return function(v_124)
                return (function()
                  local fga = v_124
                  local i1 = i_123
                  local f1 = f_122
                  return ((foldrWithIndex1(function(a_125)
                    return Data_Function.flip(foldrWithIndex2((Data_Tuple.curry(f1))(a_125)))
                  end))(i1))(fga)
                end)()
              end
            end
          end,
          foldlWithIndex = function(f_126)
            return function(i_127)
              return function(v_128)
                return (function()
                  local fga = v_128
                  local i1 = i_127
                  local f1 = f_126
                  return ((foldlWithIndex1((compose(foldlWithIndex2))(Data_Tuple.curry(f1))))(i1))(fga)
                end)()
              end
            end
          end,
          foldMapWithIndex = function(dictMonoid_129)
            return (function()
              local foldMapWithIndex3 = foldMapWithIndex1(dictMonoid_129)
              local foldMapWithIndex4 = foldMapWithIndex2(dictMonoid_129)
              return function(f_130)
                return function(v_131)
                  return (function()
                    local fga = v_131
                    local f1 = f_130
                    return (foldMapWithIndex3((compose(foldMapWithIndex4))(Data_Tuple.curry(f1))))(fga)
                  end)()
                end
              end
            end)()
          end,
          Foldable0 = function() return foldableCompose1 end
        }
      end)()
    end
  end
  local foldableWithIndexCoproduct = function(dictFoldableWithIndex_132)
    local foldrWithIndex1 = foldrWithIndex(dictFoldableWithIndex_132)
    local foldlWithIndex1 = foldlWithIndex(dictFoldableWithIndex_132)
    local foldMapWithIndex1 = foldMapWithIndex(dictFoldableWithIndex_132)
    local foldableCoproduct = Data_Foldable.foldableCoproduct(dictFoldableWithIndex_132.Foldable0(Prim.undefined))
    return function(dictFoldableWithIndex1_133)
      return (function()
        local foldrWithIndex2 = foldrWithIndex(dictFoldableWithIndex1_133)
        local foldlWithIndex2 = foldlWithIndex(dictFoldableWithIndex1_133)
        local foldMapWithIndex2 = foldMapWithIndex(dictFoldableWithIndex1_133)
        local foldableCoproduct1 = foldableCoproduct(dictFoldableWithIndex1_133.Foldable0(Prim.undefined))
        return {
          foldrWithIndex = function(f_134)
            return function(z_135)
              return (Data_Functor_Coproduct.coproduct((foldrWithIndex1((compose(f_134))(Data_Either.Left)))(z_135)))((foldrWithIndex2((compose(f_134))(Data_Either.Right)))(z_135))
            end
          end,
          foldlWithIndex = function(f_136)
            return function(z_137)
              return (Data_Functor_Coproduct.coproduct((foldlWithIndex1((compose(f_136))(Data_Either.Left)))(z_137)))((foldlWithIndex2((compose(f_136))(Data_Either.Right)))(z_137))
            end
          end,
          foldMapWithIndex = function(dictMonoid_138)
            return (function()
              local foldMapWithIndex3 = foldMapWithIndex1(dictMonoid_138)
              local foldMapWithIndex4 = foldMapWithIndex2(dictMonoid_138)
              return function(f_139)
                return (Data_Functor_Coproduct.coproduct(foldMapWithIndex3((compose(f_139))(Data_Either.Left))))(foldMapWithIndex4((compose(f_139))(Data_Either.Right)))
              end
            end)()
          end,
          Foldable0 = function() return foldableCoproduct1 end
        }
      end)()
    end
  end
  local foldableWithIndexProduct = function(dictFoldableWithIndex_140)
    local foldrWithIndex1 = foldrWithIndex(dictFoldableWithIndex_140)
    local foldlWithIndex1 = foldlWithIndex(dictFoldableWithIndex_140)
    local foldMapWithIndex1 = foldMapWithIndex(dictFoldableWithIndex_140)
    local foldableProduct = Data_Foldable.foldableProduct(dictFoldableWithIndex_140.Foldable0(Prim.undefined))
    return function(dictFoldableWithIndex1_141)
      return (function()
        local foldrWithIndex2 = foldrWithIndex(dictFoldableWithIndex1_141)
        local foldlWithIndex2 = foldlWithIndex(dictFoldableWithIndex1_141)
        local foldMapWithIndex2 = foldMapWithIndex(dictFoldableWithIndex1_141)
        local foldableProduct1 = foldableProduct(dictFoldableWithIndex1_141.Foldable0(Prim.undefined))
        return {
          foldrWithIndex = function(f_142)
            return function(z_143)
              return function(v_144)
                return (function()
                  if "Data.Tuple.Tuple" == v_144["$ctor"] then
                    return (function()
                      local ga = v_144[1]
                      local fa = v_144[0]
                      local z1 = z_143
                      local f1 = f_142
                      return ((foldrWithIndex1((compose(f1))(Data_Either.Left)))(((foldrWithIndex2((compose(f1))(Data_Either.Right)))(z1))(ga)))(fa)
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end
          end,
          foldlWithIndex = function(f_145)
            return function(z_146)
              return function(v_147)
                return (function()
                  if "Data.Tuple.Tuple" == v_147["$ctor"] then
                    return (function()
                      local ga = v_147[1]
                      local fa = v_147[0]
                      local z1 = z_146
                      local f1 = f_145
                      return ((foldlWithIndex2((compose(f1))(Data_Either.Right)))(((foldlWithIndex1((compose(f1))(Data_Either.Left)))(z1))(fa)))(ga)
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end
          end,
          foldMapWithIndex = function(dictMonoid_148)
            return (function()
              local append = Data_Semigroup.append(dictMonoid_148.Semigroup0(Prim.undefined))
              local foldMapWithIndex3 = foldMapWithIndex1(dictMonoid_148)
              local foldMapWithIndex4 = foldMapWithIndex2(dictMonoid_148)
              return function(f_149)
                return function(v_150)
                  return (function()
                    if "Data.Tuple.Tuple" == v_150["$ctor"] then
                      return (function()
                        local ga = v_150[1]
                        local fa = v_150[0]
                        local f1 = f_149
                        return (append((foldMapWithIndex3((compose(f1))(Data_Either.Left)))(fa)))((foldMapWithIndex4((compose(f1))(Data_Either.Right)))(ga))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end
            end)()
          end,
          Foldable0 = function() return foldableProduct1 end
        }
      end)()
    end
  end
  local foldlWithIndexDefault = function(dictFoldableWithIndex_151)
    local foldMapWithIndex1 = (foldMapWithIndex(dictFoldableWithIndex_151))(monoidDual)
    return function(c_152)
      return function(u_153)
        return function(xs_154)
          return (unwrap(unwrap((foldMapWithIndex1(function(i_155)
            return (compose(Data_Monoid_Dual.Dual))((compose(Data_Monoid_Endo.Endo))(Data_Function.flip(c_152(i_155))))
          end))(xs_154))))(u_153)
        end
      end
    end
  end
  local foldrWithIndexDefault = function(dictFoldableWithIndex_156)
    local foldMapWithIndex1 = (foldMapWithIndex(dictFoldableWithIndex_156))(monoidEndo)
    return function(c_157)
      return function(u_158)
        return function(xs_159)
          return (unwrap((foldMapWithIndex1(function(i_160)
            return (compose(Data_Monoid_Endo.Endo))(c_157(i_160))
          end))(xs_159)))(u_158)
        end
      end
    end
  end
  local surroundMapWithIndex = function(dictFoldableWithIndex_161)
    local foldMapWithIndex1 = (foldMapWithIndex(dictFoldableWithIndex_161))(monoidEndo)
    return function(dictSemigroup_162)
      return (function()
        local append = Data_Semigroup.append(dictSemigroup_162)
        return function(d_163)
          return function(t_164)
            return function(f_165)
              return (function()
                local joined = function(i_166)
                  return function(a_167)
                    return function(m_168)
                      return (append(d_163))((append((t_164(i_166))(a_167)))(m_168))
                    end
                  end
                end
                return (unwrap((foldMapWithIndex1(joined))(f_165)))(d_163)
              end)()
            end
          end
        end
      end)()
    end
  end
  local foldMapDefault = function(dictFoldableWithIndex_169)
    local foldMapWithIndex1 = foldMapWithIndex(dictFoldableWithIndex_169)
    return function(dictMonoid_170)
      return (function()
        local foldMapWithIndex2 = foldMapWithIndex1(dictMonoid_170)
        return function(f_171)
          return foldMapWithIndex2(Data_Function.const(f_171))
        end
      end)()
    end
  end
  local findWithIndex = function(dictFoldableWithIndex_172)
    local foldlWithIndex1 = foldlWithIndex(dictFoldableWithIndex_172)
    return function(p_173)
      return (function()
        local go = function(v_174)
          return function(v1_175)
            return function(v2_176)
              return (function()
                if "Data.Maybe.Nothing" == v1_175["$ctor"] then
                  return (function()
                    local n25 = (function() local r = v1_175 return r end)()
                    local x = v2_176
                    local i = v_174
                    return (function()
                      if (p_173(i))(x) then
                        return Data_Maybe.Just({ index = i, value = x })
                      else
                        return n25
                      end
                    end)()
                  end)()
                else
                  return (function() local r = v1_175 return r end)()
                end
              end)()
            end
          end
        end
        return (foldlWithIndex1(go))(Data_Maybe.Nothing)
      end)()
    end
  end
  local findMapWithIndex = function(dictFoldableWithIndex_177)
    local foldlWithIndex1 = foldlWithIndex(dictFoldableWithIndex_177)
    return function(f_178)
      return (function()
        local go = function(v_179)
          return function(v1_180)
            return function(v2_181)
              return (function()
                if "Data.Maybe.Nothing" == v1_180["$ctor"] then
                  return (function()
                    local x = v2_181
                    local i = v_179
                    return (f_178(i))(x)
                  end)()
                else
                  return (function() local r = v1_180 return r end)()
                end
              end)()
            end
          end
        end
        return (foldlWithIndex1(go))(Data_Maybe.Nothing)
      end)()
    end
  end
  local anyWithIndex = function(dictFoldableWithIndex_182)
    local foldMapWithIndex1 = foldMapWithIndex(dictFoldableWithIndex_182)
    return function(dictHeytingAlgebra_183)
      return (function()
        local foldMapWithIndex2 = foldMapWithIndex1(Data_Monoid_Disj.monoidDisj(dictHeytingAlgebra_183))
        return function(t_184)
          return (compose(unwrap))(foldMapWithIndex2(function(i_185)
            return (compose(Data_Monoid_Disj.Disj))(t_184(i_185))
          end))
        end
      end)()
    end
  end
  local allWithIndex = function(dictFoldableWithIndex_186)
    local foldMapWithIndex1 = foldMapWithIndex(dictFoldableWithIndex_186)
    return function(dictHeytingAlgebra_187)
      return (function()
        local foldMapWithIndex2 = foldMapWithIndex1(Data_Monoid_Conj.monoidConj(dictHeytingAlgebra_187))
        return function(t_188)
          return (compose(unwrap))(foldMapWithIndex2(function(i_189)
            return (compose(Data_Monoid_Conj.Conj))(t_188(i_189))
          end))
        end
      end)()
    end
  end
  return {
    foldrWithIndex = foldrWithIndex,
    foldlWithIndex = foldlWithIndex,
    foldMapWithIndex = foldMapWithIndex,
    foldrWithIndexDefault = foldrWithIndexDefault,
    foldlWithIndexDefault = foldlWithIndexDefault,
    foldMapWithIndexDefaultR = foldMapWithIndexDefaultR,
    foldMapWithIndexDefaultL = foldMapWithIndexDefaultL,
    foldWithIndexM = foldWithIndexM,
    traverseWithIndex_ = traverseWithIndex_,
    forWithIndex_ = forWithIndex_,
    surroundMapWithIndex = surroundMapWithIndex,
    allWithIndex = allWithIndex,
    anyWithIndex = anyWithIndex,
    findWithIndex = findWithIndex,
    findMapWithIndex = findMapWithIndex,
    foldrDefault = foldrDefault,
    foldlDefault = foldlDefault,
    foldMapDefault = foldMapDefault,
    foldableWithIndexArray = foldableWithIndexArray,
    foldableWithIndexMaybe = foldableWithIndexMaybe,
    foldableWithIndexFirst = foldableWithIndexFirst,
    foldableWithIndexLast = foldableWithIndexLast,
    foldableWithIndexAdditive = foldableWithIndexAdditive,
    foldableWithIndexDual = foldableWithIndexDual,
    foldableWithIndexDisj = foldableWithIndexDisj,
    foldableWithIndexConj = foldableWithIndexConj,
    foldableWithIndexMultiplicative = foldableWithIndexMultiplicative,
    foldableWithIndexEither = foldableWithIndexEither,
    foldableWithIndexTuple = foldableWithIndexTuple,
    foldableWithIndexIdentity = foldableWithIndexIdentity,
    foldableWithIndexConst = foldableWithIndexConst,
    foldableWithIndexProduct = foldableWithIndexProduct,
    foldableWithIndexCoproduct = foldableWithIndexCoproduct,
    foldableWithIndexCompose = foldableWithIndexCompose,
    foldableWithIndexApp = foldableWithIndexApp
  }
end)()
local Data_Ord_Max = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Max = function(x_0) return x_0 end
  local showMax = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(Max "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semigroupMax = function(dictOrd_3)
    local max = Data_Ord.max(dictOrd_3)
    return {
      append = function(v_4)
        return function(v1_5)
          return (function()
            local y = v1_5
            local x = v_4
            return (max(x))(y)
          end)()
        end
      end
    }
  end
  local newtypeMax = { Coercible0 = function() return Prim.undefined end }
  local monoidMax = function(dictBounded_6)
    local semigroupMax1 = semigroupMax(dictBounded_6.Ord0(Prim.undefined))
    return {
      mempty = Data_Bounded.bottom(dictBounded_6),
      Semigroup0 = function() return semigroupMax1 end
    }
  end
  local eqMax = function(dictEq_7) return dictEq_7 end
  local ordMax = function(dictOrd_8)
    local compare = Data_Ord.compare(dictOrd_8)
    local eqMax1 = eqMax(dictOrd_8.Eq0(Prim.undefined))
    return {
      compare = function(v_9)
        return function(v1_10)
          return (function()
            local y = v1_10
            local x = v_9
            return (compare(x))(y)
          end)()
        end
      end,
      Eq0 = function() return eqMax1 end
    }
  end
  return {
    Max = Max,
    newtypeMax = newtypeMax,
    eqMax = eqMax,
    ordMax = ordMax,
    semigroupMax = semigroupMax,
    monoidMax = monoidMax,
    showMax = showMax
  }
end)()
local Data_Ord_Min = (function()
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local Min = function(x_0) return x_0 end
  local showMin = function(dictShow_1)
    local show = Data_Show.show(dictShow_1)
    return {
      show = function(v_2)
        return (function()
          local a = v_2
          return (append("(Min "))((append(show(a)))(")"))
        end)()
      end
    }
  end
  local semigroupMin = function(dictOrd_3)
    local min = Data_Ord.min(dictOrd_3)
    return {
      append = function(v_4)
        return function(v1_5)
          return (function()
            local y = v1_5
            local x = v_4
            return (min(x))(y)
          end)()
        end
      end
    }
  end
  local newtypeMin = { Coercible0 = function() return Prim.undefined end }
  local monoidMin = function(dictBounded_6)
    local semigroupMin1 = semigroupMin(dictBounded_6.Ord0(Prim.undefined))
    return {
      mempty = Data_Bounded.top(dictBounded_6),
      Semigroup0 = function() return semigroupMin1 end
    }
  end
  local eqMin = function(dictEq_7) return dictEq_7 end
  local ordMin = function(dictOrd_8)
    local compare = Data_Ord.compare(dictOrd_8)
    local eqMin1 = eqMin(dictOrd_8.Eq0(Prim.undefined))
    return {
      compare = function(v_9)
        return function(v1_10)
          return (function()
            local y = v1_10
            local x = v_9
            return (compare(x))(y)
          end)()
        end
      end,
      Eq0 = function() return eqMin1 end
    }
  end
  return {
    Min = Min,
    newtypeMin = newtypeMin,
    eqMin = eqMin,
    ordMin = ordMin,
    semigroupMin = semigroupMin,
    monoidMin = monoidMin,
    showMin = showMin
  }
end)()
local Data_Semigroup_Foldable = (function()
  local eq = Data_Eq.eq(Data_Ordering.eqOrdering)
  local composeFlipped = Control_Semigroupoid.composeFlipped(Control_Semigroupoid.semigroupoidFn)
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local alaF = (((Data_Newtype.alaF(Prim.undefined))(Prim.undefined))(Prim.undefined))(Prim.undefined)
  local identity = Control_Category.identity(Control_Category.categoryFn)
  local ala = ((Data_Newtype.ala(Prim.undefined))(Prim.undefined))(Prim.undefined)
  local JoinWith = function(x_0) return x_0 end
  local Foldable1_S_Dict = function(x_1) return x_1 end
  local FoldRight1 = function(value0, value1)
    return {
      ["$ctor"] = "Data_Semigroup_Foldable.FoldRight1",
      value0 = value0,
      value1 = value1
    }
  end
  local Act = function(x_2) return x_2 end
  local semigroupJoinWith = function(dictSemigroup_3)
    local append = Data_Semigroup.append(dictSemigroup_3)
    return {
      append = function(v_4)
        return function(v1_5)
          return (function()
            local b = v1_5
            local a = v_4
            return function(j_6)
              return (append(a(j_6)))((append(j_6))(b(j_6)))
            end
          end)()
        end
      end
    }
  end
  local semigroupAct = function(dictApply_7)
    local applySecond = Control_Apply.applySecond(dictApply_7)
    return {
      append = function(v_8)
        return function(v1_9)
          return (function()
            local b = v1_9
            local a = v_8
            return (applySecond(a))(b)
          end)()
        end
      end
    }
  end
  local runFoldRight1 = function(v_10)
    if "Data.Semigroup.Foldable.FoldRight1" == v_10["$ctor"] then
      return (function() local a = v_10[1] local f = v_10[0] return f(a) end)()
    else
      return error("No patterns matched")
    end
  end
  local mkFoldRight1 = FoldRight1(Data_Function.const)
  local joinee = function(v_11) local x = v_11 return x end
  local getAct = function(v_12) local f = v_12 return f end
  local foldr1 = function(dict_13) local v = dict_13 return v.foldr1 end
  local foldl1 = function(dict_14) local v = dict_14 return v.foldl1 end
  local maximumBy = function(dictFoldable1_15)
    local foldl11 = foldl1(dictFoldable1_15)
    return function(cmp_16)
      return foldl11(function(x_17)
        return function(y_18)
          return (function()
            local e7 = (eq((cmp_16(x_17))(y_18)))(Data_Ordering.GT)
            return (function()
              if true == e7 then return x_17 else return y_18 end
            end)()
          end)()
        end
      end)
    end
  end
  local minimumBy = function(dictFoldable1_19)
    local foldl11 = foldl1(dictFoldable1_19)
    return function(cmp_20)
      return foldl11(function(x_21)
        return function(y_22)
          return (function()
            local e8 = (eq((cmp_20(x_21))(y_22)))(Data_Ordering.LT)
            return (function()
              if true == e8 then return x_21 else return y_22 end
            end)()
          end)()
        end
      end)
    end
  end
  local foldableTuple = {
    foldMap1 = function(dictSemigroup_23)
      return function(f_24)
        return function(v_25)
          if "Data.Tuple.Tuple" == v_25["$ctor"] then
            return (function()
              local x = v_25[1]
              local f1 = f_24
              return f1(x)
            end)()
          else
            return error("No patterns matched")
          end
        end
      end
    end,
    foldr1 = function(v_26)
      return function(v1_27)
        if "Data.Tuple.Tuple" == v1_27["$ctor"] then
          return (function() local x = v1_27[1] return x end)()
        else
          return error("No patterns matched")
        end
      end
    end,
    foldl1 = function(v_28)
      return function(v1_29)
        if "Data.Tuple.Tuple" == v1_29["$ctor"] then
          return (function() local x = v1_29[1] return x end)()
        else
          return error("No patterns matched")
        end
      end
    end,
    Foldable0 = function() return Data_Foldable.foldableTuple end
  }
  local foldableMultiplicative = {
    foldr1 = function(v_30)
      return function(v1_31) local x = v1_31 return x end
    end,
    foldl1 = function(v_32)
      return function(v1_33) local x = v1_33 return x end
    end,
    foldMap1 = function(dictSemigroup_34)
      return function(f_35)
        return function(v_36) local x = v_36 local f1 = f_35 return f1(x) end
      end
    end,
    Foldable0 = function() return Data_Foldable.foldableMultiplicative end
  }
  local foldableIdentity = {
    foldMap1 = function(dictSemigroup_37)
      return function(f_38)
        return function(v_39) local x = v_39 local f1 = f_38 return f1(x) end
      end
    end,
    foldl1 = function(v_40)
      return function(v1_41) local x = v1_41 return x end
    end,
    foldr1 = function(v_42)
      return function(v1_43) local x = v1_43 return x end
    end,
    Foldable0 = function() return Data_Foldable.foldableIdentity end
  }
  local foldableDual = {
    foldr1 = function(v_44)
      return function(v1_45) local x = v1_45 return x end
    end,
    foldl1 = function(v_46)
      return function(v1_47) local x = v1_47 return x end
    end,
    foldMap1 = function(dictSemigroup_48)
      return function(f_49)
        return function(v_50) local x = v_50 local f1 = f_49 return f1(x) end
      end
    end,
    Foldable0 = function() return Data_Foldable.foldableDual end
  }
  local foldRight1Semigroup = {
    append = function(v_51)
      return function(v1_52)
        if "Data.Semigroup.Foldable.FoldRight1" == v_51["$ctor"] then
          return (function()
            if "Data.Semigroup.Foldable.FoldRight1" == v1_52["$ctor"] then
              return (function()
                local rr = v1_52[1]
                local rf = v1_52[0]
                local lr = v_51[1]
                local lf = v_51[0]
                return (FoldRight1(function(a_53)
                  return function(f_54)
                    return (lf((f_54(lr))((rf(a_53))(f_54))))(f_54)
                  end
                end))(rr)
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        else
          return error("No patterns matched")
        end
      end
    end
  }
  local semigroupDual = Data_Monoid_Dual.semigroupDual(foldRight1Semigroup)
  local foldMap1DefaultR = function(dictFoldable1_55)
    local foldr11 = foldr1(dictFoldable1_55)
    return function(dictFunctor_56)
      return (function()
        local map = Data_Functor.map(dictFunctor_56)
        return function(dictSemigroup_57)
          return (function()
            local append = Data_Semigroup.append(dictSemigroup_57)
            return function(f_58)
              return (composeFlipped(map(f_58)))(foldr11(append))
            end
          end)()
        end
      end)()
    end
  end
  local foldMap1DefaultL = function(dictFoldable1_59)
    local foldl11 = foldl1(dictFoldable1_59)
    return function(dictFunctor_60)
      return (function()
        local map = Data_Functor.map(dictFunctor_60)
        return function(dictSemigroup_61)
          return (function()
            local append = Data_Semigroup.append(dictSemigroup_61)
            return function(f_62)
              return (composeFlipped(map(f_62)))(foldl11(append))
            end
          end)()
        end
      end)()
    end
  end
  local foldMap1 = function(dict_63) local v = dict_63 return v.foldMap1 end
  local foldl1Default = function(dictFoldable1_64)
    return (compose(Data_Function.flip((compose(runFoldRight1))(((alaF(Data_Monoid_Dual.Dual))((foldMap1(dictFoldable1_64))(semigroupDual)))(mkFoldRight1)))))(Data_Function.flip)
  end
  local foldr1Default = function(dictFoldable1_65)
    return Data_Function.flip((compose(runFoldRight1))(((foldMap1(dictFoldable1_65))(foldRight1Semigroup))(mkFoldRight1)))
  end
  local intercalateMap = function(dictFoldable1_66)
    local foldMap11 = foldMap1(dictFoldable1_66)
    return function(dictSemigroup_67)
      return (function()
        local foldMap12 = foldMap11(semigroupJoinWith(dictSemigroup_67))
        return function(j_68)
          return function(f_69)
            return function(foldable_70)
              return (joinee((foldMap12((compose(JoinWith))((compose(Data_Function.const))(f_69))))(foldable_70)))(j_68)
            end
          end
        end
      end)()
    end
  end
  local intercalate = function(dictFoldable1_71)
    local intercalateMap1 = intercalateMap(dictFoldable1_71)
    return function(dictSemigroup_72)
      return (Data_Function.flip(intercalateMap1(dictSemigroup_72)))(identity)
    end
  end
  local maximum = function(dictOrd_73)
    local semigroupMax = Data_Ord_Max.semigroupMax(dictOrd_73)
    return function(dictFoldable1_74)
      return (ala(Data_Ord_Max.Max))((foldMap1(dictFoldable1_74))(semigroupMax))
    end
  end
  local minimum = function(dictOrd_75)
    local semigroupMin = Data_Ord_Min.semigroupMin(dictOrd_75)
    return function(dictFoldable1_76)
      return (ala(Data_Ord_Min.Min))((foldMap1(dictFoldable1_76))(semigroupMin))
    end
  end
  local traverse1_ = function(dictFoldable1_77)
    local foldMap11 = foldMap1(dictFoldable1_77)
    return function(dictApply_78)
      return (function()
        local voidRight = Data_Functor.voidRight(dictApply_78.Functor0(Prim.undefined))
        local foldMap12 = foldMap11(semigroupAct(dictApply_78))
        return function(f_79)
          return function(t_80)
            return (voidRight(Data_Unit.unit))(getAct((foldMap12((compose(Act))(f_79)))(t_80)))
          end
        end
      end)()
    end
  end
  local for1_ = function(dictFoldable1_81)
    local traverse1_1 = traverse1_(dictFoldable1_81)
    return function(dictApply_82)
      return Data_Function.flip(traverse1_1(dictApply_82))
    end
  end
  local sequence1_ = function(dictFoldable1_83)
    local traverse1_1 = traverse1_(dictFoldable1_83)
    return function(dictApply_84)
      return (traverse1_1(dictApply_84))(identity)
    end
  end
  local fold1 = function(dictFoldable1_85)
    local foldMap11 = foldMap1(dictFoldable1_85)
    return function(dictSemigroup_86)
      return (foldMap11(dictSemigroup_86))(identity)
    end
  end
  return {
    foldMap1 = foldMap1,
    fold1 = fold1,
    foldr1 = foldr1,
    foldl1 = foldl1,
    traverse1_ = traverse1_,
    for1_ = for1_,
    sequence1_ = sequence1_,
    foldr1Default = foldr1Default,
    foldl1Default = foldl1Default,
    foldMap1DefaultR = foldMap1DefaultR,
    foldMap1DefaultL = foldMap1DefaultL,
    intercalate = intercalate,
    intercalateMap = intercalateMap,
    maximum = maximum,
    maximumBy = maximumBy,
    minimum = minimum,
    minimumBy = minimumBy,
    foldableDual = foldableDual,
    foldableMultiplicative = foldableMultiplicative,
    foldableTuple = foldableTuple,
    foldableIdentity = foldableIdentity
  }
end)()
local Data_Traversable_Accum = (function() return {} end)()
local Data_Traversable_Accum_Internal = (function()
  local StateR = function(x_0) return x_0 end
  local StateL = function(x_1) return x_1 end
  local stateR = function(v_2) local k = v_2 return k end
  local stateL = function(v_3) local k = v_3 return k end
  local functorStateR = {
    map = function(f_4)
      return function(k_5)
        return function(s_6)
          local v = (stateR(k_5))(s_6)
          return (function()
            local a = v.value
            local s1 = v.accum
            return { accum = s1, value = f_4(a) }
          end)()
        end
      end
    end
  }
  local functorStateL = {
    map = function(f_7)
      return function(k_8)
        return function(s_9)
          local v = (stateL(k_8))(s_9)
          return (function()
            local a = v.value
            local s1 = v.accum
            return { accum = s1, value = f_7(a) }
          end)()
        end
      end
    end
  }
  local applyStateR = {
    apply = function(f_10)
      return function(x_11)
        return function(s_12)
          local v = (stateR(x_11))(s_12)
          return (function()
            local xPrime = v.value
            local s1 = v.accum
            return (function()
              local v1 = (stateR(f_10))(s1)
              return (function()
                local fPrime = v1.value
                local s2 = v1.accum
                return { accum = s2, value = fPrime(xPrime) }
              end)()
            end)()
          end)()
        end
      end
    end,
    Functor0 = function() return functorStateR end
  }
  local applyStateL = {
    apply = function(f_13)
      return function(x_14)
        return function(s_15)
          local v = (stateL(f_13))(s_15)
          return (function()
            local fPrime = v.value
            local s1 = v.accum
            return (function()
              local v1 = (stateL(x_14))(s1)
              return (function()
                local xPrime = v1.value
                local s2 = v1.accum
                return { accum = s2, value = fPrime(xPrime) }
              end)()
            end)()
          end)()
        end
      end
    end,
    Functor0 = function() return functorStateL end
  }
  local applicativeStateR = {
    pure = function(a_16)
      return function(s_17) return { accum = s_17, value = a_16 } end
    end,
    Apply0 = function() return applyStateR end
  }
  local applicativeStateL = {
    pure = function(a_18)
      return function(s_19) return { accum = s_19, value = a_18 } end
    end,
    Apply0 = function() return applyStateL end
  }
  return {
    StateL = StateL,
    stateL = stateL,
    StateR = StateR,
    stateR = stateR,
    functorStateL = functorStateL,
    applyStateL = applyStateL,
    applicativeStateL = applicativeStateL,
    functorStateR = functorStateR,
    applyStateR = applyStateR,
    applicativeStateR = applicativeStateR
  }
end)()
local Data_Traversable = (function()
  local foreign = (function()
    local array1 = function(a)
      return { a }
    end

    local array2 = function(a)
      return function(b)
        return { a, b }
      end
    end

    local array3 = function(a)
      return function(b)
        return function(c)
          return { a, b, c }
        end
      end
    end

    local concat2 = function(xs)
      return function(ys)
        return table.concat(xs, ys)
      end
    end

    return {
      traverseArrayImpl = function(apply)
        return function(map)
          return function(pure)
            return function(f)
              return function(array)
                local function go(bot, top)
                  if top - bot == 0 then
                    return pure({})
                  elseif top - bot == 1 then
                    return map(array1)(f(array[bot]))
                  elseif top - bot == 2 then
                    return apply(map(array2)(f(array[bot])))(f(array[bot + 1]))
                  elseif top - bot == 3 then
                    return apply(apply(map(array3)(f(array[bot])))(f(array[bot + 1])))(f(array[bot + 2]))
                  else
                    -- This slightly tricky pivot selection aims to produce two
                    -- even-length partitions where possible.
                    local pivot = bot + math.floor((top - bot) / 4) * 2
                    return apply(map(concat2)(go(bot, pivot)))(go(pivot, top))
                  end
                end

                return go(0, #array)
              end
            end
          end
        end
      end
    }

  end)()
  local traverseArrayImpl = foreign.traverseArrayImpl
  local identity = Control_Category.identity(Control_Category.categoryFn)
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local Traversable_S_Dict = function(x_0) return x_0 end
  local traverse = function(dict_1) local v = dict_1 return v.traverse end
  local traversableTuple = {
    traverse = function(dictApplicative_2)
      local map = Data_Functor.map(dictApplicative_2.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(f_3)
        return function(v_4)
          return (function()
            if "Data.Tuple.Tuple" == v_4["$ctor"] then
              return (function()
                local y = v_4[1]
                local x = v_4[0]
                local f1 = f_3
                return (map(Data_Tuple.Tuple(x)))(f1(y))
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_5)
      local map = Data_Functor.map(dictApplicative_5.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_6)
        return (function()
          if "Data.Tuple.Tuple" == v_6["$ctor"] then
            return (function()
              local y = v_6[1]
              local x = v_6[0]
              return (map(Data_Tuple.Tuple(x)))(y)
            end)()
          else
            return error("No patterns matched")
          end
        end)()
      end
    end,
    Functor0 = function() return Data_Tuple.functorTuple end,
    Foldable1 = function() return Data_Foldable.foldableTuple end
  }
  local traversableMultiplicative = {
    traverse = function(dictApplicative_7)
      local map = Data_Functor.map(dictApplicative_7.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(f_8)
        return function(v_9)
          return (function()
            local x = v_9
            local f1 = f_8
            return (map(Data_Monoid_Multiplicative.Multiplicative))(f1(x))
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_10)
      local map = Data_Functor.map(dictApplicative_10.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_11)
        return (function()
          local x = v_11
          return (map(Data_Monoid_Multiplicative.Multiplicative))(x)
        end)()
      end
    end,
    Functor0 = function()
      return Data_Monoid_Multiplicative.functorMultiplicative
    end,
    Foldable1 = function() return Data_Foldable.foldableMultiplicative end
  }
  local traversableMaybe = {
    traverse = function(dictApplicative_12)
      local pure = Control_Applicative.pure(dictApplicative_12)
      local map = Data_Functor.map(dictApplicative_12.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_13)
        return function(v1_14)
          return (function()
            if "Data.Maybe.Nothing" == v1_14["$ctor"] then
              return pure(Data_Maybe.Nothing)
            else
              return (function()
                if "Data.Maybe.Just" == v1_14["$ctor"] then
                  return (function()
                    local x = v1_14[0]
                    local f = v_13
                    return (map(Data_Maybe.Just))(f(x))
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_15)
      local pure = Control_Applicative.pure(dictApplicative_15)
      local map = Data_Functor.map(dictApplicative_15.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_16)
        return (function()
          if "Data.Maybe.Nothing" == v_16["$ctor"] then
            return pure(Data_Maybe.Nothing)
          else
            return (function()
              if "Data.Maybe.Just" == v_16["$ctor"] then
                return (function()
                  local x = v_16[0]
                  return (map(Data_Maybe.Just))(x)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)()
      end
    end,
    Functor0 = function() return Data_Maybe.functorMaybe end,
    Foldable1 = function() return Data_Foldable.foldableMaybe end
  }
  local traverse1 = traverse(traversableMaybe)
  local traversableIdentity = {
    traverse = function(dictApplicative_17)
      local map = Data_Functor.map(dictApplicative_17.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(f_18)
        return function(v_19)
          return (function()
            local x = v_19
            local f1 = f_18
            return (map(Data_Identity.Identity))(f1(x))
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_20)
      local map = Data_Functor.map(dictApplicative_20.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_21)
        return (function()
          local x = v_21
          return (map(Data_Identity.Identity))(x)
        end)()
      end
    end,
    Functor0 = function() return Data_Identity.functorIdentity end,
    Foldable1 = function() return Data_Foldable.foldableIdentity end
  }
  local traversableEither = {
    traverse = function(dictApplicative_22)
      local pure = Control_Applicative.pure(dictApplicative_22)
      local map = Data_Functor.map(dictApplicative_22.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_23)
        return function(v1_24)
          return (function()
            if "Data.Either.Left" == v1_24["$ctor"] then
              return (function()
                local x = v1_24[0]
                return pure(Data_Either.Left(x))
              end)()
            else
              return (function()
                if "Data.Either.Right" == v1_24["$ctor"] then
                  return (function()
                    local x = v1_24[0]
                    local f = v_23
                    return (map(Data_Either.Right))(f(x))
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_25)
      local pure = Control_Applicative.pure(dictApplicative_25)
      local map = Data_Functor.map(dictApplicative_25.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_26)
        return (function()
          if "Data.Either.Left" == v_26["$ctor"] then
            return (function()
              local x = v_26[0]
              return pure(Data_Either.Left(x))
            end)()
          else
            return (function()
              if "Data.Either.Right" == v_26["$ctor"] then
                return (function()
                  local x = v_26[0]
                  return (map(Data_Either.Right))(x)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)()
      end
    end,
    Functor0 = function() return Data_Either.functorEither end,
    Foldable1 = function() return Data_Foldable.foldableEither end
  }
  local traversableDual = {
    traverse = function(dictApplicative_27)
      local map = Data_Functor.map(dictApplicative_27.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(f_28)
        return function(v_29)
          return (function()
            local x = v_29
            local f1 = f_28
            return (map(Data_Monoid_Dual.Dual))(f1(x))
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_30)
      local map = Data_Functor.map(dictApplicative_30.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_31)
        return (function()
          local x = v_31
          return (map(Data_Monoid_Dual.Dual))(x)
        end)()
      end
    end,
    Functor0 = function() return Data_Monoid_Dual.functorDual end,
    Foldable1 = function() return Data_Foldable.foldableDual end
  }
  local traversableDisj = {
    traverse = function(dictApplicative_32)
      local map = Data_Functor.map(dictApplicative_32.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(f_33)
        return function(v_34)
          return (function()
            local x = v_34
            local f1 = f_33
            return (map(Data_Monoid_Disj.Disj))(f1(x))
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_35)
      local map = Data_Functor.map(dictApplicative_35.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_36)
        return (function()
          local x = v_36
          return (map(Data_Monoid_Disj.Disj))(x)
        end)()
      end
    end,
    Functor0 = function() return Data_Monoid_Disj.functorDisj end,
    Foldable1 = function() return Data_Foldable.foldableDisj end
  }
  local traversableConst = {
    traverse = function(dictApplicative_37)
      local pure = Control_Applicative.pure(dictApplicative_37)
      return function(v_38)
        return function(v1_39)
          return (function() local x = v1_39 return pure(x) end)()
        end
      end
    end,
    sequence = function(dictApplicative_40)
      local pure = Control_Applicative.pure(dictApplicative_40)
      return function(v_41)
        return (function() local x = v_41 return pure(x) end)()
      end
    end,
    Functor0 = function() return Data_Const.functorConst end,
    Foldable1 = function() return Data_Foldable.foldableConst end
  }
  local traversableConj = {
    traverse = function(dictApplicative_42)
      local map = Data_Functor.map(dictApplicative_42.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(f_43)
        return function(v_44)
          return (function()
            local x = v_44
            local f1 = f_43
            return (map(Data_Monoid_Conj.Conj))(f1(x))
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_45)
      local map = Data_Functor.map(dictApplicative_45.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_46)
        return (function()
          local x = v_46
          return (map(Data_Monoid_Conj.Conj))(x)
        end)()
      end
    end,
    Functor0 = function() return Data_Monoid_Conj.functorConj end,
    Foldable1 = function() return Data_Foldable.foldableConj end
  }
  local traversableCompose
  traversableCompose = function(dictTraversable_47)
    local traverse2 = traverse(dictTraversable_47)
    local functorCompose = Data_Functor_Compose.functorCompose(dictTraversable_47.Functor0(Prim.undefined))
    local foldableCompose = Data_Foldable.foldableCompose(dictTraversable_47.Foldable1(Prim.undefined))
    return function(dictTraversable1_48)
      return (function()
        local traverse3 = traverse(dictTraversable1_48)
        local functorCompose1 = functorCompose(dictTraversable1_48.Functor0(Prim.undefined))
        local foldableCompose1 = foldableCompose(dictTraversable1_48.Foldable1(Prim.undefined))
        return {
          traverse = function(dictApplicative_49)
            return (function()
              local map = Data_Functor.map(dictApplicative_49.Apply0(Prim.undefined).Functor0(Prim.undefined))
              local traverse4 = traverse2(dictApplicative_49)
              local traverse5 = traverse3(dictApplicative_49)
              return function(f_50)
                return function(v_51)
                  return (function()
                    local fga = v_51
                    local f1 = f_50
                    return (map(Data_Functor_Compose.Compose))((traverse4(traverse5(f1)))(fga))
                  end)()
                end
              end
            end)()
          end,
          sequence = function(dictApplicative_52)
            return ((traverse((traversableCompose(dictTraversable_47))(dictTraversable1_48)))(dictApplicative_52))(identity)
          end,
          Functor0 = function() return functorCompose1 end,
          Foldable1 = function() return foldableCompose1 end
        }
      end)()
    end
  end
  local traversableAdditive = {
    traverse = function(dictApplicative_53)
      local map = Data_Functor.map(dictApplicative_53.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(f_54)
        return function(v_55)
          return (function()
            local x = v_55
            local f1 = f_54
            return (map(Data_Monoid_Additive.Additive))(f1(x))
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_56)
      local map = Data_Functor.map(dictApplicative_56.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_57)
        return (function()
          local x = v_57
          return (map(Data_Monoid_Additive.Additive))(x)
        end)()
      end
    end,
    Functor0 = function() return Data_Monoid_Additive.functorAdditive end,
    Foldable1 = function() return Data_Foldable.foldableAdditive end
  }
  local sequenceDefault = function(dictTraversable_58)
    local traverse2 = traverse(dictTraversable_58)
    return function(dictApplicative_59)
      return (traverse2(dictApplicative_59))(identity)
    end
  end
  local traversableArray
  traversableArray = {
    traverse = function(dictApplicative_60)
      local Apply0 = dictApplicative_60.Apply0(Prim.undefined)
      return ((traverseArrayImpl(Control_Apply.apply(Apply0)))(Data_Functor.map(Apply0.Functor0(Prim.undefined))))(Control_Applicative.pure(dictApplicative_60))
    end,
    sequence = function(dictApplicative_61)
      return (sequenceDefault(traversableArray))(dictApplicative_61)
    end,
    Functor0 = function() return Data_Functor.functorArray end,
    Foldable1 = function() return Data_Foldable.foldableArray end
  }
  local sequence = function(dict_62) local v = dict_62 return v.sequence end
  local sequence1 = sequence(traversableMaybe)
  local traversableApp = function(dictTraversable_63)
    local traverse2 = traverse(dictTraversable_63)
    local sequence2 = sequence(dictTraversable_63)
    local functorApp = Data_Functor_App.functorApp(dictTraversable_63.Functor0(Prim.undefined))
    local foldableApp = Data_Foldable.foldableApp(dictTraversable_63.Foldable1(Prim.undefined))
    return {
      traverse = function(dictApplicative_64)
        return (function()
          local map = Data_Functor.map(dictApplicative_64.Apply0(Prim.undefined).Functor0(Prim.undefined))
          local traverse3 = traverse2(dictApplicative_64)
          return function(f_65)
            return function(v_66)
              return (function()
                local x = v_66
                local f1 = f_65
                return (map(Data_Functor_App.App))((traverse3(f1))(x))
              end)()
            end
          end
        end)()
      end,
      sequence = function(dictApplicative_67)
        return (function()
          local map = Data_Functor.map(dictApplicative_67.Apply0(Prim.undefined).Functor0(Prim.undefined))
          local sequence3 = sequence2(dictApplicative_67)
          return function(v_68)
            return (function()
              local x = v_68
              return (map(Data_Functor_App.App))(sequence3(x))
            end)()
          end
        end)()
      end,
      Functor0 = function() return functorApp end,
      Foldable1 = function() return foldableApp end
    }
  end
  local traversableCoproduct = function(dictTraversable_69)
    local traverse2 = traverse(dictTraversable_69)
    local sequence2 = sequence(dictTraversable_69)
    local functorCoproduct = Data_Functor_Coproduct.functorCoproduct(dictTraversable_69.Functor0(Prim.undefined))
    local foldableCoproduct = Data_Foldable.foldableCoproduct(dictTraversable_69.Foldable1(Prim.undefined))
    return function(dictTraversable1_70)
      return (function()
        local traverse3 = traverse(dictTraversable1_70)
        local sequence3 = sequence(dictTraversable1_70)
        local functorCoproduct1 = functorCoproduct(dictTraversable1_70.Functor0(Prim.undefined))
        local foldableCoproduct1 = foldableCoproduct(dictTraversable1_70.Foldable1(Prim.undefined))
        return {
          traverse = function(dictApplicative_71)
            return (function()
              local map = Data_Functor.map(dictApplicative_71.Apply0(Prim.undefined).Functor0(Prim.undefined))
              local traverse4 = traverse2(dictApplicative_71)
              local traverse5 = traverse3(dictApplicative_71)
              return function(f_72)
                return (Data_Functor_Coproduct.coproduct((compose(map((compose(Data_Functor_Coproduct.Coproduct))(Data_Either.Left))))(traverse4(f_72))))((compose(map((compose(Data_Functor_Coproduct.Coproduct))(Data_Either.Right))))(traverse5(f_72)))
              end
            end)()
          end,
          sequence = function(dictApplicative_73)
            return (function()
              local map = Data_Functor.map(dictApplicative_73.Apply0(Prim.undefined).Functor0(Prim.undefined))
              return (Data_Functor_Coproduct.coproduct((compose(map((compose(Data_Functor_Coproduct.Coproduct))(Data_Either.Left))))(sequence2(dictApplicative_73))))((compose(map((compose(Data_Functor_Coproduct.Coproduct))(Data_Either.Right))))(sequence3(dictApplicative_73)))
            end)()
          end,
          Functor0 = function() return functorCoproduct1 end,
          Foldable1 = function() return foldableCoproduct1 end
        }
      end)()
    end
  end
  local traversableFirst = {
    traverse = function(dictApplicative_74)
      local map = Data_Functor.map(dictApplicative_74.Apply0(Prim.undefined).Functor0(Prim.undefined))
      local traverse2 = traverse1(dictApplicative_74)
      return function(f_75)
        return function(v_76)
          return (function()
            local x = v_76
            local f1 = f_75
            return (map(Data_Maybe_First.First))((traverse2(f1))(x))
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_77)
      local map = Data_Functor.map(dictApplicative_77.Apply0(Prim.undefined).Functor0(Prim.undefined))
      local sequence2 = sequence1(dictApplicative_77)
      return function(v_78)
        return (function()
          local x = v_78
          return (map(Data_Maybe_First.First))(sequence2(x))
        end)()
      end
    end,
    Functor0 = function() return Data_Maybe_First.functorFirst end,
    Foldable1 = function() return Data_Foldable.foldableFirst end
  }
  local traversableLast = {
    traverse = function(dictApplicative_79)
      local map = Data_Functor.map(dictApplicative_79.Apply0(Prim.undefined).Functor0(Prim.undefined))
      local traverse2 = traverse1(dictApplicative_79)
      return function(f_80)
        return function(v_81)
          return (function()
            local x = v_81
            local f1 = f_80
            return (map(Data_Maybe_Last.Last))((traverse2(f1))(x))
          end)()
        end
      end
    end,
    sequence = function(dictApplicative_82)
      local map = Data_Functor.map(dictApplicative_82.Apply0(Prim.undefined).Functor0(Prim.undefined))
      local sequence2 = sequence1(dictApplicative_82)
      return function(v_83)
        return (function()
          local x = v_83
          return (map(Data_Maybe_Last.Last))(sequence2(x))
        end)()
      end
    end,
    Functor0 = function() return Data_Maybe_Last.functorLast end,
    Foldable1 = function() return Data_Foldable.foldableLast end
  }
  local traversableProduct = function(dictTraversable_84)
    local traverse2 = traverse(dictTraversable_84)
    local sequence2 = sequence(dictTraversable_84)
    local functorProduct = Data_Functor_Product.functorProduct(dictTraversable_84.Functor0(Prim.undefined))
    local foldableProduct = Data_Foldable.foldableProduct(dictTraversable_84.Foldable1(Prim.undefined))
    return function(dictTraversable1_85)
      return (function()
        local traverse3 = traverse(dictTraversable1_85)
        local sequence3 = sequence(dictTraversable1_85)
        local functorProduct1 = functorProduct(dictTraversable1_85.Functor0(Prim.undefined))
        local foldableProduct1 = foldableProduct(dictTraversable1_85.Foldable1(Prim.undefined))
        return {
          traverse = function(dictApplicative_86)
            return (function()
              local lift2 = Control_Apply.lift2(dictApplicative_86.Apply0(Prim.undefined))
              local traverse4 = traverse2(dictApplicative_86)
              local traverse5 = traverse3(dictApplicative_86)
              return function(f_87)
                return function(v_88)
                  return (function()
                    if "Data.Tuple.Tuple" == v_88["$ctor"] then
                      return (function()
                        local ga = v_88[1]
                        local fa = v_88[0]
                        local f1 = f_87
                        return ((lift2(Data_Functor_Product.product))((traverse4(f1))(fa)))((traverse5(f1))(ga))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end
            end)()
          end,
          sequence = function(dictApplicative_89)
            return (function()
              local lift2 = Control_Apply.lift2(dictApplicative_89.Apply0(Prim.undefined))
              local sequence4 = sequence2(dictApplicative_89)
              local sequence5 = sequence3(dictApplicative_89)
              return function(v_90)
                return (function()
                  if "Data.Tuple.Tuple" == v_90["$ctor"] then
                    return (function()
                      local ga = v_90[1]
                      local fa = v_90[0]
                      return ((lift2(Data_Functor_Product.product))(sequence4(fa)))(sequence5(ga))
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end)()
          end,
          Functor0 = function() return functorProduct1 end,
          Foldable1 = function() return foldableProduct1 end
        }
      end)()
    end
  end
  local traverseDefault = function(dictTraversable_91)
    local sequence2 = sequence(dictTraversable_91)
    local map = Data_Functor.map(dictTraversable_91.Functor0(Prim.undefined))
    return function(dictApplicative_92)
      return (function()
        local sequence3 = sequence2(dictApplicative_92)
        return function(f_93)
          return function(ta_94) return sequence3((map(f_93))(ta_94)) end
        end
      end)()
    end
  end
  local mapAccumR = function(dictTraversable_95)
    local traverse2 = (traverse(dictTraversable_95))(Data_Traversable_Accum_Internal.applicativeStateR)
    return function(f_96)
      return function(s0_97)
        return function(xs_98)
          return (Data_Traversable_Accum_Internal.stateR((traverse2(function( a_99 )
            return function(s_100) return (f_96(s_100))(a_99) end
          end))(xs_98)))(s0_97)
        end
      end
    end
  end
  local scanr = function(dictTraversable_101)
    local mapAccumR1 = mapAccumR(dictTraversable_101)
    return function(f_102)
      return function(b0_103)
        return function(xs_104)
          return ((mapAccumR1(function(b_105)
            return function(a_106)
              return (function()
                local bPrime = (f_102(a_106))(b_105)
                return { accum = bPrime, value = bPrime }
              end)()
            end
          end))(b0_103))(xs_104).value
        end
      end
    end
  end
  local mapAccumL = function(dictTraversable_107)
    local traverse2 = (traverse(dictTraversable_107))(Data_Traversable_Accum_Internal.applicativeStateL)
    return function(f_108)
      return function(s0_109)
        return function(xs_110)
          return (Data_Traversable_Accum_Internal.stateL((traverse2(function( a_111 )
            return function(s_112) return (f_108(s_112))(a_111) end
          end))(xs_110)))(s0_109)
        end
      end
    end
  end
  local scanl = function(dictTraversable_113)
    local mapAccumL1 = mapAccumL(dictTraversable_113)
    return function(f_114)
      return function(b0_115)
        return function(xs_116)
          return ((mapAccumL1(function(b_117)
            return function(a_118)
              return (function()
                local bPrime = (f_114(b_117))(a_118)
                return { accum = bPrime, value = bPrime }
              end)()
            end
          end))(b0_115))(xs_116).value
        end
      end
    end
  end
  local _for_ = function(dictApplicative_119)
    return function(dictTraversable_120)
      local traverse2 = (traverse(dictTraversable_120))(dictApplicative_119)
      return function(x_121)
        return function(f_122) return (traverse2(f_122))(x_121) end
      end
    end
  end
  return {
    traverse = traverse,
    sequence = sequence,
    traverseDefault = traverseDefault,
    sequenceDefault = sequenceDefault,
    _for_ = _for_,
    scanl = scanl,
    scanr = scanr,
    mapAccumL = mapAccumL,
    mapAccumR = mapAccumR,
    traversableArray = traversableArray,
    traversableMaybe = traversableMaybe,
    traversableFirst = traversableFirst,
    traversableLast = traversableLast,
    traversableAdditive = traversableAdditive,
    traversableDual = traversableDual,
    traversableConj = traversableConj,
    traversableDisj = traversableDisj,
    traversableMultiplicative = traversableMultiplicative,
    traversableEither = traversableEither,
    traversableTuple = traversableTuple,
    traversableIdentity = traversableIdentity,
    traversableConst = traversableConst,
    traversableProduct = traversableProduct,
    traversableCoproduct = traversableCoproduct,
    traversableCompose = traversableCompose,
    traversableApp = traversableApp
  }
end)()
local Data_Semigroup_Traversable = (function()
  local identity = Control_Category.identity(Control_Category.categoryFn)
  local Traversable1_S_Dict = function(x_0) return x_0 end
  local traverse1 = function(dict_1) local v = dict_1 return v.traverse1 end
  local traversableTuple = {
    traverse1 = function(dictApply_2)
      local map = Data_Functor.map(dictApply_2.Functor0(Prim.undefined))
      return function(f_3)
        return function(v_4)
          return (function()
            if "Data.Tuple.Tuple" == v_4["$ctor"] then
              return (function()
                local y = v_4[1]
                local x = v_4[0]
                local f1 = f_3
                return (map(Data_Tuple.Tuple(x)))(f1(y))
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end,
    sequence1 = function(dictApply_5)
      local map = Data_Functor.map(dictApply_5.Functor0(Prim.undefined))
      return function(v_6)
        return (function()
          if "Data.Tuple.Tuple" == v_6["$ctor"] then
            return (function()
              local y = v_6[1]
              local x = v_6[0]
              return (map(Data_Tuple.Tuple(x)))(y)
            end)()
          else
            return error("No patterns matched")
          end
        end)()
      end
    end,
    Foldable10 = function() return Data_Semigroup_Foldable.foldableTuple end,
    Traversable1 = function() return Data_Traversable.traversableTuple end
  }
  local traversableIdentity = {
    traverse1 = function(dictApply_7)
      local map = Data_Functor.map(dictApply_7.Functor0(Prim.undefined))
      return function(f_8)
        return function(v_9)
          return (function()
            local x = v_9
            local f1 = f_8
            return (map(Data_Identity.Identity))(f1(x))
          end)()
        end
      end
    end,
    sequence1 = function(dictApply_10)
      local map = Data_Functor.map(dictApply_10.Functor0(Prim.undefined))
      return function(v_11)
        return (function()
          local x = v_11
          return (map(Data_Identity.Identity))(x)
        end)()
      end
    end,
    Foldable10 = function() return Data_Semigroup_Foldable.foldableIdentity end,
    Traversable1 = function() return Data_Traversable.traversableIdentity end
  }
  local sequence1Default = function(dictTraversable1_12)
    local traverse11 = traverse1(dictTraversable1_12)
    return function(dictApply_13)
      return (traverse11(dictApply_13))(identity)
    end
  end
  local traversableDual
  traversableDual = {
    traverse1 = function(dictApply_14)
      local map = Data_Functor.map(dictApply_14.Functor0(Prim.undefined))
      return function(f_15)
        return function(v_16)
          return (function()
            local x = v_16
            local f1 = f_15
            return (map(Data_Monoid_Dual.Dual))(f1(x))
          end)()
        end
      end
    end,
    sequence1 = function(dictApply_17)
      return (sequence1Default(traversableDual))(dictApply_17)
    end,
    Foldable10 = function() return Data_Semigroup_Foldable.foldableDual end,
    Traversable1 = function() return Data_Traversable.traversableDual end
  }
  local traversableMultiplicative
  traversableMultiplicative = {
    traverse1 = function(dictApply_18)
      local map = Data_Functor.map(dictApply_18.Functor0(Prim.undefined))
      return function(f_19)
        return function(v_20)
          return (function()
            local x = v_20
            local f1 = f_19
            return (map(Data_Monoid_Multiplicative.Multiplicative))(f1(x))
          end)()
        end
      end
    end,
    sequence1 = function(dictApply_21)
      return (sequence1Default(traversableMultiplicative))(dictApply_21)
    end,
    Foldable10 = function()
      return Data_Semigroup_Foldable.foldableMultiplicative
    end,
    Traversable1 = function()
      return Data_Traversable.traversableMultiplicative
    end
  }
  local sequence1 = function(dict_22) local v = dict_22 return v.sequence1 end
  local traverse1Default = function(dictTraversable1_23)
    local sequence11 = sequence1(dictTraversable1_23)
    local map = Data_Functor.map(dictTraversable1_23.Traversable1(Prim.undefined).Functor0(Prim.undefined))
    return function(dictApply_24)
      return (function()
        local sequence12 = sequence11(dictApply_24)
        return function(f_25)
          return function(ta_26) return sequence12((map(f_25))(ta_26)) end
        end
      end)()
    end
  end
  return {
    sequence1 = sequence1,
    traverse1 = traverse1,
    traverse1Default = traverse1Default,
    sequence1Default = sequence1Default,
    traversableDual = traversableDual,
    traversableMultiplicative = traversableMultiplicative,
    traversableTuple = traversableTuple,
    traversableIdentity = traversableIdentity
  }
end)()
local Data_TraversableWithIndex = (function()
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local traverse = Data_Traversable.traverse(Data_Traversable.traversableMultiplicative)
  local traverse1 = Data_Traversable.traverse(Data_Traversable.traversableMaybe)
  local traverse2 = Data_Traversable.traverse(Data_Traversable.traversableLast)
  local traverse3 = Data_Traversable.traverse(Data_Traversable.traversableFirst)
  local traverse4 = Data_Traversable.traverse(Data_Traversable.traversableDual)
  local traverse5 = Data_Traversable.traverse(Data_Traversable.traversableDisj)
  local traverse6 = Data_Traversable.traverse(Data_Traversable.traversableConj)
  local traverse7 = Data_Traversable.traverse(Data_Traversable.traversableAdditive)
  local TraversableWithIndex_S_Dict = function(x_0) return x_0 end
  local traverseWithIndexDefault = function(dictTraversableWithIndex_1)
    local sequence = Data_Traversable.sequence(dictTraversableWithIndex_1.Traversable2(Prim.undefined))
    local mapWithIndex = Data_FunctorWithIndex.mapWithIndex(dictTraversableWithIndex_1.FunctorWithIndex0(Prim.undefined))
    return function(dictApplicative_2)
      return (function()
        local sequence1 = sequence(dictApplicative_2)
        return function(f_3) return (compose(sequence1))(mapWithIndex(f_3)) end
      end)()
    end
  end
  local traverseWithIndex = function(dict_4)
    local v = dict_4
    return v.traverseWithIndex
  end
  local traverseDefault = function(dictTraversableWithIndex_5)
    local traverseWithIndex1 = traverseWithIndex(dictTraversableWithIndex_5)
    return function(dictApplicative_6)
      return (function()
        local traverseWithIndex2 = traverseWithIndex1(dictApplicative_6)
        return function(f_7)
          return traverseWithIndex2(Data_Function.const(f_7))
        end
      end)()
    end
  end
  local traversableWithIndexTuple = {
    traverseWithIndex = function(dictApplicative_8)
      local map = Data_Functor.map(dictApplicative_8.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(f_9)
        return function(v_10)
          return (function()
            if "Data.Tuple.Tuple" == v_10["$ctor"] then
              return (function()
                local y = v_10[1]
                local x = v_10[0]
                local f1 = f_9
                return (map(Data_Tuple.Tuple(x)))((f1(Data_Unit.unit))(y))
              end)()
            else
              return error("No patterns matched")
            end
          end)()
        end
      end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexTuple
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexTuple
    end,
    Traversable2 = function() return Data_Traversable.traversableTuple end
  }
  local traversableWithIndexProduct = function(dictTraversableWithIndex_11)
    local traverseWithIndex1 = traverseWithIndex(dictTraversableWithIndex_11)
    local functorWithIndexProduct = Data_FunctorWithIndex.functorWithIndexProduct(dictTraversableWithIndex_11.FunctorWithIndex0(Prim.undefined))
    local foldableWithIndexProduct = Data_FoldableWithIndex.foldableWithIndexProduct(dictTraversableWithIndex_11.FoldableWithIndex1(Prim.undefined))
    local traversableProduct = Data_Traversable.traversableProduct(dictTraversableWithIndex_11.Traversable2(Prim.undefined))
    return function(dictTraversableWithIndex1_12)
      return (function()
        local traverseWithIndex2 = traverseWithIndex(dictTraversableWithIndex1_12)
        local functorWithIndexProduct1 = functorWithIndexProduct(dictTraversableWithIndex1_12.FunctorWithIndex0(Prim.undefined))
        local foldableWithIndexProduct1 = foldableWithIndexProduct(dictTraversableWithIndex1_12.FoldableWithIndex1(Prim.undefined))
        local traversableProduct1 = traversableProduct(dictTraversableWithIndex1_12.Traversable2(Prim.undefined))
        return {
          traverseWithIndex = function(dictApplicative_13)
            return (function()
              local lift2 = Control_Apply.lift2(dictApplicative_13.Apply0(Prim.undefined))
              local traverseWithIndex3 = traverseWithIndex1(dictApplicative_13)
              local traverseWithIndex4 = traverseWithIndex2(dictApplicative_13)
              return function(f_14)
                return function(v_15)
                  return (function()
                    if "Data.Tuple.Tuple" == v_15["$ctor"] then
                      return (function()
                        local ga = v_15[1]
                        local fa = v_15[0]
                        local f1 = f_14
                        return ((lift2(Data_Functor_Product.product))((traverseWithIndex3((compose(f1))(Data_Either.Left)))(fa)))((traverseWithIndex4((compose(f1))(Data_Either.Right)))(ga))
                      end)()
                    else
                      return error("No patterns matched")
                    end
                  end)()
                end
              end
            end)()
          end,
          FunctorWithIndex0 = function() return functorWithIndexProduct1 end,
          FoldableWithIndex1 = function() return foldableWithIndexProduct1 end,
          Traversable2 = function() return traversableProduct1 end
        }
      end)()
    end
  end
  local traversableWithIndexMultiplicative = {
    traverseWithIndex = function(dictApplicative_16)
      local traverse8 = traverse(dictApplicative_16)
      return function(f_17) return traverse8(f_17(Data_Unit.unit)) end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexMultiplicative
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexMultiplicative
    end,
    Traversable2 = function()
      return Data_Traversable.traversableMultiplicative
    end
  }
  local traversableWithIndexMaybe = {
    traverseWithIndex = function(dictApplicative_18)
      local traverse8 = traverse1(dictApplicative_18)
      return function(f_19) return traverse8(f_19(Data_Unit.unit)) end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexMaybe
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexMaybe
    end,
    Traversable2 = function() return Data_Traversable.traversableMaybe end
  }
  local traversableWithIndexLast = {
    traverseWithIndex = function(dictApplicative_20)
      local traverse8 = traverse2(dictApplicative_20)
      return function(f_21) return traverse8(f_21(Data_Unit.unit)) end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexLast
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexLast
    end,
    Traversable2 = function() return Data_Traversable.traversableLast end
  }
  local traversableWithIndexIdentity = {
    traverseWithIndex = function(dictApplicative_22)
      local map = Data_Functor.map(dictApplicative_22.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(f_23)
        return function(v_24)
          return (function()
            local x = v_24
            local f1 = f_23
            return (map(Data_Identity.Identity))((f1(Data_Unit.unit))(x))
          end)()
        end
      end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexIdentity
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexIdentity
    end,
    Traversable2 = function() return Data_Traversable.traversableIdentity end
  }
  local traversableWithIndexFirst = {
    traverseWithIndex = function(dictApplicative_25)
      local traverse8 = traverse3(dictApplicative_25)
      return function(f_26) return traverse8(f_26(Data_Unit.unit)) end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexFirst
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexFirst
    end,
    Traversable2 = function() return Data_Traversable.traversableFirst end
  }
  local traversableWithIndexEither = {
    traverseWithIndex = function(dictApplicative_27)
      local pure = Control_Applicative.pure(dictApplicative_27)
      local map = Data_Functor.map(dictApplicative_27.Apply0(Prim.undefined).Functor0(Prim.undefined))
      return function(v_28)
        return function(v1_29)
          return (function()
            if "Data.Either.Left" == v1_29["$ctor"] then
              return (function()
                local x = v1_29[0]
                return pure(Data_Either.Left(x))
              end)()
            else
              return (function()
                if "Data.Either.Right" == v1_29["$ctor"] then
                  return (function()
                    local x = v1_29[0]
                    local f = v_28
                    return (map(Data_Either.Right))((f(Data_Unit.unit))(x))
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end
      end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexEither
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexEither
    end,
    Traversable2 = function() return Data_Traversable.traversableEither end
  }
  local traversableWithIndexDual = {
    traverseWithIndex = function(dictApplicative_30)
      local traverse8 = traverse4(dictApplicative_30)
      return function(f_31) return traverse8(f_31(Data_Unit.unit)) end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexDual
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexDual
    end,
    Traversable2 = function() return Data_Traversable.traversableDual end
  }
  local traversableWithIndexDisj = {
    traverseWithIndex = function(dictApplicative_32)
      local traverse8 = traverse5(dictApplicative_32)
      return function(f_33) return traverse8(f_33(Data_Unit.unit)) end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexDisj
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexDisj
    end,
    Traversable2 = function() return Data_Traversable.traversableDisj end
  }
  local traversableWithIndexCoproduct = function(dictTraversableWithIndex_34)
    local traverseWithIndex1 = traverseWithIndex(dictTraversableWithIndex_34)
    local functorWithIndexCoproduct = Data_FunctorWithIndex.functorWithIndexCoproduct(dictTraversableWithIndex_34.FunctorWithIndex0(Prim.undefined))
    local foldableWithIndexCoproduct = Data_FoldableWithIndex.foldableWithIndexCoproduct(dictTraversableWithIndex_34.FoldableWithIndex1(Prim.undefined))
    local traversableCoproduct = Data_Traversable.traversableCoproduct(dictTraversableWithIndex_34.Traversable2(Prim.undefined))
    return function(dictTraversableWithIndex1_35)
      return (function()
        local traverseWithIndex2 = traverseWithIndex(dictTraversableWithIndex1_35)
        local functorWithIndexCoproduct1 = functorWithIndexCoproduct(dictTraversableWithIndex1_35.FunctorWithIndex0(Prim.undefined))
        local foldableWithIndexCoproduct1 = foldableWithIndexCoproduct(dictTraversableWithIndex1_35.FoldableWithIndex1(Prim.undefined))
        local traversableCoproduct1 = traversableCoproduct(dictTraversableWithIndex1_35.Traversable2(Prim.undefined))
        return {
          traverseWithIndex = function(dictApplicative_36)
            return (function()
              local map = Data_Functor.map(dictApplicative_36.Apply0(Prim.undefined).Functor0(Prim.undefined))
              local traverseWithIndex3 = traverseWithIndex1(dictApplicative_36)
              local traverseWithIndex4 = traverseWithIndex2(dictApplicative_36)
              return function(f_37)
                return (Data_Functor_Coproduct.coproduct((compose(map((compose(Data_Functor_Coproduct.Coproduct))(Data_Either.Left))))(traverseWithIndex3((compose(f_37))(Data_Either.Left)))))((compose(map((compose(Data_Functor_Coproduct.Coproduct))(Data_Either.Right))))(traverseWithIndex4((compose(f_37))(Data_Either.Right))))
              end
            end)()
          end,
          FunctorWithIndex0 = function() return functorWithIndexCoproduct1 end,
          FoldableWithIndex1 = function()
            return foldableWithIndexCoproduct1
          end,
          Traversable2 = function() return traversableCoproduct1 end
        }
      end)()
    end
  end
  local traversableWithIndexConst = {
    traverseWithIndex = function(dictApplicative_38)
      local pure = Control_Applicative.pure(dictApplicative_38)
      return function(v_39)
        return function(v1_40)
          return (function() local x = v1_40 return pure(x) end)()
        end
      end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexConst
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexConst
    end,
    Traversable2 = function() return Data_Traversable.traversableConst end
  }
  local traversableWithIndexConj = {
    traverseWithIndex = function(dictApplicative_41)
      local traverse8 = traverse6(dictApplicative_41)
      return function(f_42) return traverse8(f_42(Data_Unit.unit)) end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexConj
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexConj
    end,
    Traversable2 = function() return Data_Traversable.traversableConj end
  }
  local traversableWithIndexCompose = function(dictTraversableWithIndex_43)
    local traverseWithIndex1 = traverseWithIndex(dictTraversableWithIndex_43)
    local functorWithIndexCompose = Data_FunctorWithIndex.functorWithIndexCompose(dictTraversableWithIndex_43.FunctorWithIndex0(Prim.undefined))
    local foldableWithIndexCompose = Data_FoldableWithIndex.foldableWithIndexCompose(dictTraversableWithIndex_43.FoldableWithIndex1(Prim.undefined))
    local traversableCompose = Data_Traversable.traversableCompose(dictTraversableWithIndex_43.Traversable2(Prim.undefined))
    return function(dictTraversableWithIndex1_44)
      return (function()
        local traverseWithIndex2 = traverseWithIndex(dictTraversableWithIndex1_44)
        local functorWithIndexCompose1 = functorWithIndexCompose(dictTraversableWithIndex1_44.FunctorWithIndex0(Prim.undefined))
        local foldableWithIndexCompose1 = foldableWithIndexCompose(dictTraversableWithIndex1_44.FoldableWithIndex1(Prim.undefined))
        local traversableCompose1 = traversableCompose(dictTraversableWithIndex1_44.Traversable2(Prim.undefined))
        return {
          traverseWithIndex = function(dictApplicative_45)
            return (function()
              local map = Data_Functor.map(dictApplicative_45.Apply0(Prim.undefined).Functor0(Prim.undefined))
              local traverseWithIndex3 = traverseWithIndex1(dictApplicative_45)
              local traverseWithIndex4 = traverseWithIndex2(dictApplicative_45)
              return function(f_46)
                return function(v_47)
                  return (function()
                    local fga = v_47
                    local f1 = f_46
                    return (map(Data_Functor_Compose.Compose))((traverseWithIndex3((compose(traverseWithIndex4))(Data_Tuple.curry(f1))))(fga))
                  end)()
                end
              end
            end)()
          end,
          FunctorWithIndex0 = function() return functorWithIndexCompose1 end,
          FoldableWithIndex1 = function() return foldableWithIndexCompose1 end,
          Traversable2 = function() return traversableCompose1 end
        }
      end)()
    end
  end
  local traversableWithIndexArray
  traversableWithIndexArray = {
    traverseWithIndex = function(dictApplicative_48)
      return (traverseWithIndexDefault(traversableWithIndexArray))(dictApplicative_48)
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexArray
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexArray
    end,
    Traversable2 = function() return Data_Traversable.traversableArray end
  }
  local traversableWithIndexApp = function(dictTraversableWithIndex_49)
    local traverseWithIndex1 = traverseWithIndex(dictTraversableWithIndex_49)
    local functorWithIndexApp = Data_FunctorWithIndex.functorWithIndexApp(dictTraversableWithIndex_49.FunctorWithIndex0(Prim.undefined))
    local foldableWithIndexApp = Data_FoldableWithIndex.foldableWithIndexApp(dictTraversableWithIndex_49.FoldableWithIndex1(Prim.undefined))
    local traversableApp = Data_Traversable.traversableApp(dictTraversableWithIndex_49.Traversable2(Prim.undefined))
    return {
      traverseWithIndex = function(dictApplicative_50)
        return (function()
          local map = Data_Functor.map(dictApplicative_50.Apply0(Prim.undefined).Functor0(Prim.undefined))
          local traverseWithIndex2 = traverseWithIndex1(dictApplicative_50)
          return function(f_51)
            return function(v_52)
              return (function()
                local x = v_52
                local f1 = f_51
                return (map(Data_Functor_App.App))((traverseWithIndex2(f1))(x))
              end)()
            end
          end
        end)()
      end,
      FunctorWithIndex0 = function() return functorWithIndexApp end,
      FoldableWithIndex1 = function() return foldableWithIndexApp end,
      Traversable2 = function() return traversableApp end
    }
  end
  local traversableWithIndexAdditive = {
    traverseWithIndex = function(dictApplicative_53)
      local traverse8 = traverse7(dictApplicative_53)
      return function(f_54) return traverse8(f_54(Data_Unit.unit)) end
    end,
    FunctorWithIndex0 = function()
      return Data_FunctorWithIndex.functorWithIndexAdditive
    end,
    FoldableWithIndex1 = function()
      return Data_FoldableWithIndex.foldableWithIndexAdditive
    end,
    Traversable2 = function() return Data_Traversable.traversableAdditive end
  }
  local mapAccumRWithIndex = function(dictTraversableWithIndex_55)
    local traverseWithIndex1 = (traverseWithIndex(dictTraversableWithIndex_55))(Data_Traversable_Accum_Internal.applicativeStateR)
    return function(f_56)
      return function(s0_57)
        return function(xs_58)
          return (Data_Traversable_Accum_Internal.stateR((traverseWithIndex1(function( i_59 )
            return function(a_60)
              return function(s_61) return ((f_56(i_59))(s_61))(a_60) end
            end
          end))(xs_58)))(s0_57)
        end
      end
    end
  end
  local scanrWithIndex = function(dictTraversableWithIndex_62)
    local mapAccumRWithIndex1 = mapAccumRWithIndex(dictTraversableWithIndex_62)
    return function(f_63)
      return function(b0_64)
        return function(xs_65)
          return ((mapAccumRWithIndex1(function(i_66)
            return function(b_67)
              return function(a_68)
                return (function()
                  local bPrime = ((f_63(i_66))(a_68))(b_67)
                  return { accum = bPrime, value = bPrime }
                end)()
              end
            end
          end))(b0_64))(xs_65).value
        end
      end
    end
  end
  local mapAccumLWithIndex = function(dictTraversableWithIndex_69)
    local traverseWithIndex1 = (traverseWithIndex(dictTraversableWithIndex_69))(Data_Traversable_Accum_Internal.applicativeStateL)
    return function(f_70)
      return function(s0_71)
        return function(xs_72)
          return (Data_Traversable_Accum_Internal.stateL((traverseWithIndex1(function( i_73 )
            return function(a_74)
              return function(s_75) return ((f_70(i_73))(s_75))(a_74) end
            end
          end))(xs_72)))(s0_71)
        end
      end
    end
  end
  local scanlWithIndex = function(dictTraversableWithIndex_76)
    local mapAccumLWithIndex1 = mapAccumLWithIndex(dictTraversableWithIndex_76)
    return function(f_77)
      return function(b0_78)
        return function(xs_79)
          return ((mapAccumLWithIndex1(function(i_80)
            return function(b_81)
              return function(a_82)
                return (function()
                  local bPrime = ((f_77(i_80))(b_81))(a_82)
                  return { accum = bPrime, value = bPrime }
                end)()
              end
            end
          end))(b0_78))(xs_79).value
        end
      end
    end
  end
  local forWithIndex = function(dictApplicative_83)
    return function(dictTraversableWithIndex_84)
      return Data_Function.flip((traverseWithIndex(dictTraversableWithIndex_84))(dictApplicative_83))
    end
  end
  return {
    traverseWithIndex = traverseWithIndex,
    traverseWithIndexDefault = traverseWithIndexDefault,
    forWithIndex = forWithIndex,
    scanlWithIndex = scanlWithIndex,
    mapAccumLWithIndex = mapAccumLWithIndex,
    scanrWithIndex = scanrWithIndex,
    mapAccumRWithIndex = mapAccumRWithIndex,
    traverseDefault = traverseDefault,
    traversableWithIndexArray = traversableWithIndexArray,
    traversableWithIndexMaybe = traversableWithIndexMaybe,
    traversableWithIndexFirst = traversableWithIndexFirst,
    traversableWithIndexLast = traversableWithIndexLast,
    traversableWithIndexAdditive = traversableWithIndexAdditive,
    traversableWithIndexDual = traversableWithIndexDual,
    traversableWithIndexConj = traversableWithIndexConj,
    traversableWithIndexDisj = traversableWithIndexDisj,
    traversableWithIndexMultiplicative = traversableWithIndexMultiplicative,
    traversableWithIndexEither = traversableWithIndexEither,
    traversableWithIndexTuple = traversableWithIndexTuple,
    traversableWithIndexIdentity = traversableWithIndexIdentity,
    traversableWithIndexConst = traversableWithIndexConst,
    traversableWithIndexProduct = traversableWithIndexProduct,
    traversableWithIndexCoproduct = traversableWithIndexCoproduct,
    traversableWithIndexCompose = traversableWithIndexCompose,
    traversableWithIndexApp = traversableWithIndexApp
  }
end)()
local Data_Unfoldable1 = (function()
  local foreign = (function()
    return {
      unfoldr1ArrayImpl = function(isNothing)
        return function(fromJust)
          return function(fst)
            return function(snd)
              return function(f)
                return function(b)
                  local result = {}
                  local value = b
                  while true do
                    local tuple = f(value)
                    table.insert(result, fst(tuple))
                    local maybe = snd(tuple)
                    if isNothing(maybe) then return result end
                    value = fromJust(maybe)
                  end
                end
              end
            end
          end
        end
      end
    }

  end)()
  local unfoldr1ArrayImpl = foreign.unfoldr1ArrayImpl
  local fromJust = Data_Maybe.fromJust(Prim.undefined)
  local lessThanOrEq = Data_Ord.lessThanOrEq(Data_Ord.ordInt)
  local sub = Data_Ring.sub(Data_Ring.ringInt)
  local add = Data_Semiring.add(Data_Semiring.semiringInt)
  local eq = Data_Eq.eq(Data_Eq.eqInt)
  local greaterThanOrEq = Data_Ord.greaterThanOrEq(Data_Ord.ordInt)
  local negate = Data_Ring.negate(Data_Ring.ringInt)
  local greaterThan = Data_Ord.greaterThan(Data_Ord.ordInt)
  local Unfoldable1_S_Dict = function(x_0) return x_0 end
  local unfoldr1 = function(dict_1) local v = dict_1 return v.unfoldr1 end
  local unfoldable1Maybe = {
    unfoldr1 = function(f_2)
      return function(b_3) return Data_Maybe.Just(Data_Tuple.fst(f_2(b_3))) end
    end
  }
  local unfoldable1Array = {
    unfoldr1 = (((unfoldr1ArrayImpl(Data_Maybe.isNothing))(Partial_Unsafe.unsafePartial(function(  )
      return fromJust
    end)))(Data_Tuple.fst))(Data_Tuple.snd)
  }
  local replicate1 = function(dictUnfoldable1_4)
    local unfoldr11 = unfoldr1(dictUnfoldable1_4)
    return function(n_5)
      return function(v_6)
        return (function()
          local step = function(i_7)
            return (function()
              local n1 = error("No patterns matched")
              local i1 = i_7
              return (function()
                if (lessThanOrEq(i1))(0) then
                  return (Data_Tuple.Tuple(v_6))(Data_Maybe.Nothing)
                else
                  return (function()
                    if Data_Boolean.otherwise then
                      return (Data_Tuple.Tuple(v_6))(Data_Maybe.Just((sub(i1))(1)))
                    else
                      return n1
                    end
                  end)()
                end
              end)()
            end)()
          end
          return (unfoldr11(step))((sub(n_5))(1))
        end)()
      end
    end
  end
  local replicate1A = function(dictApply_8)
    return function(dictUnfoldable1_9)
      local replicate11 = replicate1(dictUnfoldable1_9)
      return function(dictTraversable1_10)
        return (function()
          local sequence1 = (Data_Semigroup_Traversable.sequence1(dictTraversable1_10))(dictApply_8)
          return function(n_11)
            return function(m_12)
              return sequence1((replicate11(n_11))(m_12))
            end
          end
        end)()
      end
    end
  end
  local singleton = function(dictUnfoldable1_13)
    return (replicate1(dictUnfoldable1_13))(1)
  end
  local range = function(dictUnfoldable1_14)
    local unfoldr11 = unfoldr1(dictUnfoldable1_14)
    return function(start_15)
      return function(end_16)
        return (function()
          local go = function(delta_17)
            return function(i_18)
              return (function()
                local iPrime = (add(i_18))(delta_17)
                return (Data_Tuple.Tuple(i_18))((function()
                  local e2 = (eq(i_18))(end_16)
                  return (function()
                    if true == e2 then
                      return Data_Maybe.Nothing
                    else
                      return Data_Maybe.Just(iPrime)
                    end
                  end)()
                end)())
              end)()
            end
          end
          return (function()
            local delta = (function()
              local e3 = (greaterThanOrEq(end_16))(start_15)
              return (function()
                if true == e3 then return 1 else return negate(1) end
              end)()
            end)()
            return (unfoldr11(go(delta)))(start_15)
          end)()
        end)()
      end
    end
  end
  local iterateN = function(dictUnfoldable1_19)
    local unfoldr11 = unfoldr1(dictUnfoldable1_19)
    return function(n_20)
      return function(f_21)
        return function(s_22)
          return (function()
            local go = function(v_23)
              return (function()
                if "Data.Tuple.Tuple" == v_23["$ctor"] then
                  return (function()
                    local nPrime = v_23[1]
                    local x = v_23[0]
                    return (Data_Tuple.Tuple(x))((function()
                      local e4 = (greaterThan(nPrime))(0)
                      return (function()
                        if true == e4 then
                          return Data_Maybe.Just((Data_Tuple.Tuple(f_21(x)))((sub(nPrime))(1)))
                        else
                          return Data_Maybe.Nothing
                        end
                      end)()
                    end)())
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
            return (unfoldr11(go))((Data_Tuple.Tuple(s_22))((sub(n_20))(1)))
          end)()
        end
      end
    end
  end
  return {
    unfoldr1 = unfoldr1,
    replicate1 = replicate1,
    replicate1A = replicate1A,
    singleton = singleton,
    range = range,
    iterateN = iterateN,
    unfoldable1Array = unfoldable1Array,
    unfoldable1Maybe = unfoldable1Maybe
  }
end)()
local Data_Array_NonEmpty_Internal = (function()
  local foreign = (function()
    return {

      foldr1Impl = function(f)
        return function(xs)
          local acc = xs[#xs]
          for i = #xs - 1, 1, -1 do
            acc = f(xs[i])(acc)
          end
          return acc
        end
      end,

      foldl1Impl = function(f)
        return function(xs)
          local acc = xs[1]
          for i = 2, #xs do
            acc = f(acc)(xs[i])
          end
          return acc
        end
      end,

      traverse1Impl = (function()
        local function Cont(this, fn)
          this.fn = fn
        end

        local emptyList = {}

        local function ConsCell(this, head, tail)
          this.head = head
          this.tail = tail
        end

        local function finalCell(head)
          return ConsCell(head, emptyList)
        end

        local function consList(x)
          return function(xs) return ConsCell(x, xs) end
        end

        local function listToArray(list)
          local arr = {}
          local xs = list
          while xs ~= emptyList do
            table.insert(arr, xs.head)
            xs = xs.tail
          end
          return arr
        end

        return function(apply)
          return function(map)
            return function(f)
              local function buildFrom(x, ys)
                return apply(map(consList)(f(x)))(ys)
              end

              local function go(acc, currentLen, xs)
                if currentLen == 0 then
                  return acc
                else
                  local last = xs[currentLen]
                  return Cont(function()
                    return go(buildFrom(last, acc), currentLen - 1, xs)
                  end)
                end
              end

              return function(array)
                local acc = map(finalCell)(f(array[#array]))
                local result = go(acc, #array - 1, array)
                while result.fn do result = result.fn() end
                return map(listToArray)(result)
              end
            end
          end
        end
      end)()

    }

  end)()
  local foldr1Impl = foreign.foldr1Impl
  local foldl1Impl = foreign.foldl1Impl
  local traverse1Impl = foreign.traverse1Impl
  local append = Data_Semigroup.append(Data_Semigroup.semigroupString)
  local NonEmptyArray = function(x_0) return x_0 end
  local unfoldable1NonEmptyArray = Data_Unfoldable1.unfoldable1Array
  local traversableWithIndexNonEmptyArray = Data_TraversableWithIndex.traversableWithIndexArray
  local traversableNonEmptyArray = Data_Traversable.traversableArray
  local showNonEmptyArray = function(dictShow_1)
    local show = Data_Show.show(Data_Show.showArray(dictShow_1))
    return {
      show = function(v_2)
        return (function()
          local xs = v_2
          return (append("(NonEmptyArray "))((append(show(xs)))(")"))
        end)()
      end
    }
  end
  local semigroupNonEmptyArray = Data_Semigroup.semigroupArray
  local ordNonEmptyArray = function(dictOrd_3)
    return Data_Ord.ordArray(dictOrd_3)
  end
  local ord1NonEmptyArray = Data_Ord.ord1Array
  local monadNonEmptyArray = Control_Monad.monadArray
  local functorWithIndexNonEmptyArray = Data_FunctorWithIndex.functorWithIndexArray
  local functorNonEmptyArray = Data_Functor.functorArray
  local foldableWithIndexNonEmptyArray = Data_FoldableWithIndex.foldableWithIndexArray
  local foldableNonEmptyArray = Data_Foldable.foldableArray
  local foldable1NonEmptyArray
  foldable1NonEmptyArray = {
    foldMap1 = function(dictSemigroup_4)
      return ((Data_Semigroup_Foldable.foldMap1DefaultL(foldable1NonEmptyArray))(functorNonEmptyArray))(dictSemigroup_4)
    end,
    foldr1 = foldr1Impl,
    foldl1 = foldl1Impl,
    Foldable0 = function() return foldableNonEmptyArray end
  }
  local traversable1NonEmptyArray
  traversable1NonEmptyArray = {
    traverse1 = function(dictApply_5)
      return (traverse1Impl(Control_Apply.apply(dictApply_5)))(Data_Functor.map(dictApply_5.Functor0(Prim.undefined)))
    end,
    sequence1 = function(dictApply_6)
      return (Data_Semigroup_Traversable.sequence1Default(traversable1NonEmptyArray))(dictApply_6)
    end,
    Foldable10 = function() return foldable1NonEmptyArray end,
    Traversable1 = function() return traversableNonEmptyArray end
  }
  local eqNonEmptyArray = function(dictEq_7)
    return Data_Eq.eqArray(dictEq_7)
  end
  local eq1NonEmptyArray = Data_Eq.eq1Array
  local bindNonEmptyArray = Control_Bind.bindArray
  local applyNonEmptyArray = Control_Apply.applyArray
  local applicativeNonEmptyArray = Control_Applicative.applicativeArray
  local altNonEmptyArray = Control_Alt.altArray
  return {
    NonEmptyArray = NonEmptyArray,
    showNonEmptyArray = showNonEmptyArray,
    eqNonEmptyArray = eqNonEmptyArray,
    eq1NonEmptyArray = eq1NonEmptyArray,
    ordNonEmptyArray = ordNonEmptyArray,
    ord1NonEmptyArray = ord1NonEmptyArray,
    semigroupNonEmptyArray = semigroupNonEmptyArray,
    functorNonEmptyArray = functorNonEmptyArray,
    functorWithIndexNonEmptyArray = functorWithIndexNonEmptyArray,
    foldableNonEmptyArray = foldableNonEmptyArray,
    foldableWithIndexNonEmptyArray = foldableWithIndexNonEmptyArray,
    foldable1NonEmptyArray = foldable1NonEmptyArray,
    unfoldable1NonEmptyArray = unfoldable1NonEmptyArray,
    traversableNonEmptyArray = traversableNonEmptyArray,
    traversableWithIndexNonEmptyArray = traversableWithIndexNonEmptyArray,
    traversable1NonEmptyArray = traversable1NonEmptyArray,
    applyNonEmptyArray = applyNonEmptyArray,
    applicativeNonEmptyArray = applicativeNonEmptyArray,
    bindNonEmptyArray = bindNonEmptyArray,
    monadNonEmptyArray = monadNonEmptyArray,
    altNonEmptyArray = altNonEmptyArray
  }
end)()
local Data_Array_ST = (function()
  local foreign = (function()
    local function copyImpl(xs)
      return function() return table.move(xs, 1, #xs, 1, {}) end
    end

    return {
      new = function() return {} end,

      peekImpl = function(just)
        return function(nothing)
          return function(i)
            return function(xs)
              return function()
                if i >= 0 and i < #xs then
                  return just(xs[i + 1])
                else
                  return nothing
                end
              end
            end
          end
        end
      end,

      poke = function(i)
        return function(a)
          return function(xs)
            return function()
              local ret = i >= 0 and i < #xs
              if ret then xs[i + 1] = a end
              return ret
            end
          end
        end
      end,

      length = function(xs) return function() return #xs end end,

      popImpl = function(just)
        return function(nothing)
          return function(xs)
            return function()
              if #xs > 0 then
                return just(table.remove(xs))
              else
                return nothing
              end
            end
          end
        end
      end,

      pushAll = function(as)
        return function(xs)
          return function()
            local r = table.move(as, 1, #as, #xs + 1, xs)
            return #r
          end
        end
      end,

      shiftImpl = function(just)
        return function(nothing)
          return function(xs)
            return function()
              if #xs > 0 then
                return just(table.remove(xs, 1))
              else
                return nothing
              end
            end
          end
        end
      end,

      unshiftAll = function(as)
        return function(xs)
          return function()
            local r = table.move(as, 1, #as, 1, xs)
            return #r
          end
        end
      end,

      splice = function(i)
        return function(howMany)
          return function(bs)
            return function(xs)
              return function()
                return table.move(xs, i + howMany + 1, #xs, i + #bs + 1, xs)
              end
            end
          end
        end
      end,

      unsafeFreeze = function(xs) return function() return xs end end,

      unsafeThaw = function(xs) return function() return xs end end,

      freeze = copyImpl,

      thaw = copyImpl,

      sortByImpl = (function()
        local function rshift(x, by)
          return math.floor(x / 2 ^ by)
        end

        local function mergeFromTo(compare, fromOrdering, xs1, xs2, from, to)
          local mid, i, j, k, x, y, c

          mid = from + rshift(to - from, 1)
          if mid - from > 1 then
            mergeFromTo(compare, fromOrdering, xs2, xs1, from, mid)
          end
          if to - mid > 1 then
            mergeFromTo(compare, fromOrdering, xs2, xs1, mid, to)
          end

          i = from
          j = mid
          k = from
          while i < mid and j < to do
            x = xs2[i + 1]
            y = xs2[j + 1]
            c = fromOrdering(compare(x)(y))
            if c > 0 then
              xs1[k + 1] = y
              j = j + 1
            else
              xs1[k + 1] = x
              i = i + 1
            end
            k = k + 1
          end
          while i < mid do
            xs1[k + 1] = xs2[i + 1]
            i = i + 1
            k = k + 1
          end
          while j < to do
            xs1[k + 1] = xs2[j + 1]
            j = j + 1
            k = k + 1
          end
        end

        return function(compare)
          return function(fromOrdering)
            return function(xs)
              return function()
                if #xs < 2 then return xs end
                mergeFromTo(
                  compare,
                  fromOrdering,
                  xs,
                  table.move(xs, 1, #xs, 1, {}), 0, #xs
                )
                return xs
              end
            end
          end
        end
      end)(),

      toAssocArray = function(xs)
        return function()
          local r = {}
          for i = 1, #xs do
            r[i] = { index = i - 1, value = xs[i] }
          end
          return r
        end
      end,

    }

  end)()
  local unsafeFreeze = foreign.unsafeFreeze
  local unsafeThaw = foreign.unsafeThaw
  local new = foreign.new
  local thaw = foreign.thaw
  local shiftImpl = foreign.shiftImpl
  local sortByImpl = foreign.sortByImpl
  local freeze = foreign.freeze
  local peekImpl = foreign.peekImpl
  local poke = foreign.poke
  local length = foreign.length
  local popImpl = foreign.popImpl
  local pushAll = foreign.pushAll
  local unshiftAll = foreign.unshiftAll
  local splice = foreign.splice
  local toAssocArray = foreign.toAssocArray
  local bind = Control_Bind.bind(Control_Monad_ST_Internal.bindST)
  local negate = Data_Ring.negate(Data_Ring.ringInt)
  local pure = Control_Applicative.pure(Control_Monad_ST_Internal.applicativeST)
  local withArray = function(f_0)
    return function(xs_1)
      return (bind(thaw(xs_1)))(function(result_2)
        return (bind(f_0(result_2)))(function()
          return unsafeFreeze(result_2)
        end)
      end)
    end
  end
  local unshift = function(a_3) return unshiftAll({ a_3 }) end
  local sortBy = function(comp_4)
    return (sortByImpl(comp_4))(function(v_5)
      if "Data.Ordering.GT" == v_5["$ctor"] then
        return 1
      else
        return (function()
          if "Data.Ordering.EQ" == v_5["$ctor"] then
            return 0
          else
            return (function()
              if "Data.Ordering.LT" == v_5["$ctor"] then
                return negate(1)
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)()
      end
    end)
  end
  local sortWith = function(dictOrd_6)
    local comparing = Data_Ord.comparing(dictOrd_6)
    return function(f_7) return sortBy(comparing(f_7)) end
  end
  local sort = function(dictOrd_8)
    return sortBy(Data_Ord.compare(dictOrd_8))
  end
  local shift = (shiftImpl(Data_Maybe.Just))(Data_Maybe.Nothing)
  local run = function(st_9)
    return Control_Monad_ST_Internal.run((bind(st_9))(unsafeFreeze))
  end
  local push = function(a_10) return pushAll({ a_10 }) end
  local pop = (popImpl(Data_Maybe.Just))(Data_Maybe.Nothing)
  local peek = (peekImpl(Data_Maybe.Just))(Data_Maybe.Nothing)
  local modify = function(i_11)
    return function(f_12)
      return function(xs_13)
        return (bind((peek(i_11))(xs_13)))(function(entry_14)
          if "Data.Maybe.Just" == entry_14["$ctor"] then
            return (function()
              local x = entry_14[0]
              return ((poke(i_11))(f_12(x)))(xs_13)
            end)()
          else
            return (function()
              if "Data.Maybe.Nothing" == entry_14["$ctor"] then
                return pure(false)
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)
      end
    end
  end
  return {
    run = run,
    withArray = withArray,
    new = new,
    peek = peek,
    poke = poke,
    modify = modify,
    length = length,
    pop = pop,
    push = push,
    pushAll = pushAll,
    shift = shift,
    unshift = unshift,
    unshiftAll = unshiftAll,
    splice = splice,
    sort = sort,
    sortBy = sortBy,
    sortWith = sortWith,
    freeze = freeze,
    thaw = thaw,
    unsafeFreeze = unsafeFreeze,
    unsafeThaw = unsafeThaw,
    toAssocArray = toAssocArray
  }
end)()
local Data_Array_ST_Iterator = (function()
  local bind = Control_Bind.bind(Control_Monad_ST_Internal.bindST)
  local pure = Control_Applicative.pure(Control_Monad_ST_Internal.applicativeST)
  local add = Data_Semiring.add(Data_Semiring.semiringInt)
  local map = Data_Functor.map(Control_Monad_ST_Internal.functorST)
  local _not_ = Data_HeytingAlgebra._not_(Data_HeytingAlgebra.heytingAlgebraBoolean)
  local void = Data_Functor.void(Control_Monad_ST_Internal.functorST)
  local Iterator = function(value0, value1)
    return {
      ["$ctor"] = "Data_Array_ST_Iterator.Iterator",
      value0 = value0,
      value1 = value1
    }
  end
  local peek = function(v_0)
    if "Data.Array.ST.Iterator.Iterator" == v_0["$ctor"] then
      return (function()
        local currentIndex = v_0[1]
        local f = v_0[0]
        return (bind(Control_Monad_ST_Internal.read(currentIndex)))(function( i_1 )
          return pure(f(i_1))
        end)
      end)()
    else
      return error("No patterns matched")
    end
  end
  local next = function(v_2)
    if "Data.Array.ST.Iterator.Iterator" == v_2["$ctor"] then
      return (function()
        local currentIndex = v_2[1]
        local f = v_2[0]
        return (bind(Control_Monad_ST_Internal.read(currentIndex)))(function( i_3 )
          return (bind((Control_Monad_ST_Internal.modify(function(v1_4)
            return (add(v1_4))(1)
          end))(currentIndex)))(function() return pure(f(i_3)) end)
        end)
      end)()
    else
      return error("No patterns matched")
    end
  end
  local pushWhile = function(p_5)
    return function(iter_6)
      return function(array_7)
        return (bind(Control_Monad_ST_Internal.new(false)))(function(break_8)
          return (Control_Monad_ST_Internal._while_((map(_not_))(Control_Monad_ST_Internal.read(break_8))))((bind(peek(iter_6)))(function( mx_9 )
            if "Data.Maybe.Just" == mx_9["$ctor"] then
              return (function()
                local n2 = void((Control_Monad_ST_Internal.write(true))(break_8))
                local x = mx_9[0]
                return (function()
                  if p_5(x) then
                    return (bind((Data_Array_ST.push(x))(array_7)))(function()
                      return void(next(iter_6))
                    end)
                  else
                    return n2
                  end
                end)()
              end)()
            else
              return void((Control_Monad_ST_Internal.write(true))(break_8))
            end
          end))
        end)
      end
    end
  end
  local pushAll = pushWhile(Data_Function.const(true))
  local iterator = function(f_10)
    return (map(Iterator(f_10)))(Control_Monad_ST_Internal.new(0))
  end
  local iterate = function(iter_11)
    return function(f_12)
      return (bind(Control_Monad_ST_Internal.new(false)))(function(break_13)
        return (Control_Monad_ST_Internal._while_((map(_not_))(Control_Monad_ST_Internal.read(break_13))))((bind(next(iter_11)))(function( mx_14 )
          if "Data.Maybe.Just" == mx_14["$ctor"] then
            return (function() local x = mx_14[0] return f_12(x) end)()
          else
            return (function()
              if "Data.Maybe.Nothing" == mx_14["$ctor"] then
                return void((Control_Monad_ST_Internal.write(true))(break_13))
              else
                return error("No patterns matched")
              end
            end)()
          end
        end))
      end)
    end
  end
  local exhausted = ((Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn))(map(Data_Maybe.isNothing)))(peek)
  return {
    iterator = iterator,
    iterate = iterate,
    next = next,
    peek = peek,
    exhausted = exhausted,
    pushWhile = pushWhile,
    pushAll = pushAll
  }
end)()
local Data_Unfoldable = (function()
  local foreign = (function()
    return {
      unfoldrArrayImpl = function(isNothing)
        return function(fromJust)
          return function(fst)
            return function(snd)
              return function(f)
                return function(b)
                  local result = {}
                  local value = b
                  while true do
                    local maybe = f(value)
                    if isNothing(maybe) then return result end
                    local tuple = fromJust(maybe)
                    table.insert(result, fst(tuple))
                    value = snd(tuple)
                  end
                end
              end
            end
          end
        end
      end
    }

  end)()
  local unfoldrArrayImpl = foreign.unfoldrArrayImpl
  local map = Data_Functor.map(Data_Maybe.functorMaybe)
  local fromJust = Data_Maybe.fromJust(Prim.undefined)
  local lessThanOrEq = Data_Ord.lessThanOrEq(Data_Ord.ordInt)
  local sub = Data_Ring.sub(Data_Ring.ringInt)
  local Unfoldable_S_Dict = function(x_0) return x_0 end
  local unfoldr = function(dict_1) local v = dict_1 return v.unfoldr end
  local unfoldableMaybe = {
    unfoldr = function(f_2)
      return function(b_3) return (map(Data_Tuple.fst))(f_2(b_3)) end
    end,
    Unfoldable10 = function() return Data_Unfoldable1.unfoldable1Maybe end
  }
  local unfoldableArray = {
    unfoldr = (((unfoldrArrayImpl(Data_Maybe.isNothing))(Partial_Unsafe.unsafePartial(function(  )
      return fromJust
    end)))(Data_Tuple.fst))(Data_Tuple.snd),
    Unfoldable10 = function() return Data_Unfoldable1.unfoldable1Array end
  }
  local replicate = function(dictUnfoldable_4)
    local unfoldr1 = unfoldr(dictUnfoldable_4)
    return function(n_5)
      return function(v_6)
        return (function()
          local step = function(i_7)
            return (function()
              local e1 = (lessThanOrEq(i_7))(0)
              return (function()
                if true == e1 then
                  return Data_Maybe.Nothing
                else
                  return Data_Maybe.Just((Data_Tuple.Tuple(v_6))((sub(i_7))(1)))
                end
              end)()
            end)()
          end
          return (unfoldr1(step))(n_5)
        end)()
      end
    end
  end
  local replicateA = function(dictApplicative_8)
    return function(dictUnfoldable_9)
      local replicate1 = replicate(dictUnfoldable_9)
      return function(dictTraversable_10)
        return (function()
          local sequence = (Data_Traversable.sequence(dictTraversable_10))(dictApplicative_8)
          return function(n_11)
            return function(m_12) return sequence((replicate1(n_11))(m_12)) end
          end
        end)()
      end
    end
  end
  local none = function(dictUnfoldable_13)
    return ((unfoldr(dictUnfoldable_13))(Data_Function.const(Data_Maybe.Nothing)))(Data_Unit.unit)
  end
  local fromMaybe = function(dictUnfoldable_14)
    return (unfoldr(dictUnfoldable_14))(function(b_15)
      return (map((Data_Function.flip(Data_Tuple.Tuple))(Data_Maybe.Nothing)))(b_15)
    end)
  end
  return {
    unfoldr = unfoldr,
    replicate = replicate,
    replicateA = replicateA,
    none = none,
    fromMaybe = fromMaybe,
    unfoldableArray = unfoldableArray,
    unfoldableMaybe = unfoldableMaybe
  }
end)()
local Data_Array = (function()
  local foreign = (function()
    return {
      range = function(start)
        return function(end_)
          local step = start > end_ and -1 or 1
          local result = {}
          local i, n = start, 1
          while i ~= end_ do
            result[n] = i
            n = n + 1
            i = i + step
          end
          result[n] = i
          return result
        end
      end,

      replicate = function(count)
        return function(value)
          if count < 1 then
            return {}
          end
          local result = {}
          for i = 1, count do
            result[i] = value
          end
          return result
        end
      end,

      fromFoldableImpl = (function()
        local function Cons(head, tail) return { head = head, tail = tail } end

        local emptyList = {}

        local function curryCons(head)
          return function(tail) return Cons(head, tail) end
        end

        local function listToArray(list)
          local result = {}
          local count = 1
          local xs = list
          while xs ~= emptyList do
            result[count] = xs.head
            count = count + 1
            xs = xs.tail
          end
          return result
        end

        return function(foldr)
          return function(xs)
            return listToArray(foldr(curryCons)(emptyList)(xs))
          end
        end
      end)(),

      length = function(xs) return #xs end,

      unconsImpl = function(empty)
        return function(next)
          return function(xs)
            if #xs == 0 then return empty({}) end
            return next(xs[1])(table.pack(table.unpack(xs, 2)))
          end
        end
      end,

      indexImpl = function(just)
        return function(nothing)
          return function(xs)
            return function(i)
              if i < 0 or i >= #xs
              then return nothing
              else return just(xs[i + 1])
              end
            end
          end
        end
      end,

      findMapImpl = function(nothing)
        return function(isJust)
          return function(f)
            return function(xs)
              for i = 1, #xs do
                local result = f(xs[i])
                if isJust(result) then return result end
              end
              return nothing
            end
          end
        end
      end,

      findIndexImpl = function(just)
        return function(nothing)
          return function(f)
            return function(xs)
              for i = 1, #xs do
                if f(xs[i]) then return just(i - 1) end
              end
              return nothing
            end
          end
        end
      end,

      findLastIndexImpl = function(just)
        return function(nothing)
          return function(f)
            return function(xs)
              for i = #xs, 1, -1 do
                if f(xs[i]) then return just(i - 1) end
              end
              return nothing
            end
          end
        end
      end,

      _insertAt = function(just)
        return function(nothing)
          return function(i)
            return function(a)
              return function(l)
                if i < 0 or i > #l then return nothing end
                local l1 = table.pack(table.unpack(l))
                table.insert(l1, i + 1, a)
                return just(l1)
              end
            end
          end
        end
      end,

      _deleteAt = function(just)
        return function(nothing)
          return function(i)
            return function(l)
              if i < 0 or i >= #l then return nothing end
              local l1 = table.pack(table.unpack(l))
              table.remove(l1, i + 1)
              return just(l1)
            end
          end
        end
      end,

      _updateAt = function(just)
        return function(nothing)
          return function(i)
            return function(f)
              return function(l)
                if i < 0 or i >= #l then return nothing end
                local l1 = table.pack(table.unpack(l))
                l1[i + 1] = f(l1[i + 1])
                return just(l1)
              end
            end
          end
        end
      end,

      reverse = function(xs)
        local result, l = {}, #xs
        for i = l, 1, -1 do result[l - i + 1] = xs[i] end
        return result
      end,

      concat = function(xss)
        local result = {}
        local l = 1
        for i = 1, #xss do
          local xs = xss[i]
          for j = 1, #xs do
            result[l] = xs[j]
            l = l + 1
          end
        end
        return result
      end,

      filter = function(f)
        return function(xs)
          local result = {}
          local l = 1
          for i = 1, #xs do
            local x = xs[i]
            if f(x) then
              result[l] = x
              l = l + 1
            end
          end
          return result
        end
      end,

      partition = function(f)
        return function(xs)
          local yes, no = {}, {}
          local l1, l2 = 1, 1
          for i = 1, #xs do
            local x = xs[i]
            if f(x) then
              yes[l1] = x
              l1 = l1 + 1
            else
              no[l2] = x
              l2 = l2 + 1
            end
          end
          return { yes = yes, no = no }
        end
      end,

      scanl = function(f)
        return function(b)
          return function(xs)
            local result = {}
            local acc = b
            for i = 1, #xs do
              acc = f(acc)(xs[i])
              result[i] = acc
            end
            return result
          end
        end
      end,

      scanr = function(f)
        return function(b)
          return function(xs)
            local result = {}
            local acc = b
            for i = #xs, 1, -1 do
              acc = f(xs[i])(acc)
              result[i] = acc
            end
            return result
          end
        end
      end,

      sortByImpl = (function()
        local function rshift(x, by)
          return math.floor(x / 2 ^ by)
        end

        local function mergeFromTo(compare, fromOrdering, xs1, xs2, from, to)
          local mid, i, j, k, x, y, c

          mid = from + rshift(to - from, 1)
          if mid - from > 1 then
            mergeFromTo(compare, fromOrdering, xs2, xs1, from, mid)
          end
          if to - mid > 1 then
            mergeFromTo(compare, fromOrdering, xs2, xs1, mid, to)
          end

          i = from
          j = mid
          k = from
          while i < mid and j < to do
            x = xs2[i + 1]
            y = xs2[j + 1]
            c = fromOrdering(compare(x)(y))
            if c > 0 then
              xs1[k + 1] = y
              j = j + 1
            else
              xs1[k + 1] = x
              i = i + 1
            end
            k = k + 1
          end
          while i < mid do
            xs1[k + 1] = xs2[i + 1]
            i = i + 1
            k = k + 1
          end
          while j < to do
            xs1[k + 1] = xs2[j + 1]
            j = j + 1
            k = k + 1
          end
        end

        return function(compare)
          return function(fromOrdering)
            return function(xs)
              if #xs < 2 then return xs end
              local out = table.pack(table.unpack(xs))
              local slice = table.pack(table.unpack(xs))
              mergeFromTo(compare, fromOrdering, out, slice, 0, #xs)
              return out
            end
          end
        end

      end)(),

      slice = function(s)
        return function(e)
          return function(t)
            local spliced = {}
            for i, el in ipairs(t) do
              if i > s and i <= e then table.insert(spliced, el) end
            end
            return spliced
          end
        end
      end,

      zipWith = function(f)
        return function(xs)
          return function(ys)
            local l = #xs < #ys and #xs or #ys
            local result = {}
            for i = 1, l do
              result[i] = f(xs[i])(ys[i])
            end
            return result
          end
        end
      end,

      any = function(p)
        return function(xs)
          for i = 1, #xs do
            if p(xs[i]) then return true end
          end
          return false
        end
      end,

      all = function(p)
        return function(xs)
          for i = 1, #xs do
            if not p(xs[i]) then return false end
          end
          return true
        end
      end,

      unsafeIndexImpl = function(xs)
        return function(n)
          return xs[n + 1]
        end
      end,
    }

  end)()
  local fromFoldableImpl = foreign.fromFoldableImpl
  local range = foreign.range
  local replicate = foreign.replicate
  local length = foreign.length
  local unconsImpl = foreign.unconsImpl
  local indexImpl = foreign.indexImpl
  local findMapImpl = foreign.findMapImpl
  local findIndexImpl = foreign.findIndexImpl
  local findLastIndexImpl = foreign.findLastIndexImpl
  local _insertAt = foreign._insertAt
  local _deleteAt = foreign._deleteAt
  local _updateAt = foreign._updateAt
  local reverse = foreign.reverse
  local concat = foreign.concat
  local filter = foreign.filter
  local partition = foreign.partition
  local scanl = foreign.scanl
  local scanr = foreign.scanr
  local sortByImpl = foreign.sortByImpl
  local slice = foreign.slice
  local zipWith = foreign.zipWith
  local any = foreign.any
  local all = foreign.all
  local unsafeIndexImpl = foreign.unsafeIndexImpl
  local sequence = Data_Traversable.sequence(Data_Traversable.traversableArray)
  local traverse_ = Data_Foldable.traverse_(Control_Monad_ST_Internal.applicativeST)
  local lessThan = Data_Ord.lessThan(Data_Ord.ordInt)
  local add = Data_Semiring.add(Data_Semiring.semiringInt)
  local lessThanOrEq = Data_Ord.lessThanOrEq(Data_Ord.ordInt)
  local negate = Data_Ring.negate(Data_Ring.ringInt)
  local eq = Data_Eq.eq(Data_Eq.eqInt)
  local bind = Control_Bind.bind(Control_Monad_ST_Internal.bindST)
  local discard = (Control_Bind.discard(Control_Bind.discardUnit))(Control_Monad_ST_Internal.bindST)
  local map = Data_Functor.map(Control_Monad_ST_Internal.functorST)
  local compose = Control_Semigroupoid.compose(Control_Semigroupoid.semigroupoidFn)
  local _not_ = Data_HeytingAlgebra._not_(Data_HeytingAlgebra.heytingAlgebraBoolean)
  local when = Control_Applicative.when(Control_Monad_ST_Internal.applicativeST)
  local void = Data_Functor.void(Control_Monad_ST_Internal.functorST)
  local pure = Control_Applicative.pure(Control_Monad_ST_Internal.applicativeST)
  local intercalate1 = Data_Foldable.intercalate(Data_Foldable.foldableArray)
  local zero = Data_Semiring.zero(Data_Semiring.semiringInt)
  local sub = Data_Ring.sub(Data_Ring.ringInt)
  local one = Data_Semiring.one(Data_Semiring.semiringInt)
  local apply = Control_Apply.apply(Data_Maybe.applyMaybe)
  local map1 = Data_Functor.map(Data_Maybe.functorMaybe)
  local map2 = Data_Functor.map(Data_Functor.functorArray)
  local fromJust = Data_Maybe.fromJust(Prim.undefined)
  local notEq = Data_Eq.notEq(Data_Ordering.eqOrdering)
  local eq1 = Data_Eq.eq(Data_Ordering.eqOrdering)
  local greaterThanOrEq = Data_Ord.greaterThanOrEq(Data_Ord.ordInt)
  local foldMap1 = Data_Foldable.foldMap(Data_Foldable.foldableArray)
  local fold1 = Data_Foldable.fold(Data_Foldable.foldableArray)
  local append = Data_Semigroup.append(Data_Semigroup.semigroupArray)
  local composeFlipped = Control_Semigroupoid.composeFlipped(Control_Semigroupoid.semigroupoidFn)
  local traverse = Data_Traversable.traverse(Data_Traversable.traversableArray)
  local zipWithA = function(dictApplicative_0)
    local sequence1 = sequence(dictApplicative_0)
    return function(f_1)
      return function(xs_2)
        return function(ys_3) return sequence1(((zipWith(f_1))(xs_2))(ys_3)) end
      end
    end
  end
  local zip = zipWith(Data_Tuple.Tuple)
  local updateAtIndices = function(dictFoldable_4)
    local traverse_1 = traverse_(dictFoldable_4)
    return function(us_5)
      return function(xs_6)
        return Control_Monad_ST_Internal.run((Data_Array_ST.withArray(function( res_7 )
          return (traverse_1(function(v_8)
            return (function()
              if "Data.Tuple.Tuple" == v_8["$ctor"] then
                return (function()
                  local a = v_8[1]
                  local i = v_8[0]
                  return ((Data_Array_ST.poke(i))(a))(res_7)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end))(us_5)
        end))(xs_6))
      end
    end
  end
  local updateAt = (_updateAt(Data_Maybe.Just))(Data_Maybe.Nothing)
  local unsafeIndex = function() return unsafeIndexImpl end
  local unsafeIndex1 = unsafeIndex(Prim.undefined)
  local uncons = (unconsImpl(Data_Function.const(Data_Maybe.Nothing)))(function( x_9 )
    return function(xs_10)
      return Data_Maybe.Just({ head = x_9, tail = xs_10 })
    end
  end)
  local toUnfoldable = function(dictUnfoldable_11)
    local unfoldr = Data_Unfoldable.unfoldr(dictUnfoldable_11)
    return function(xs_12)
      return (function()
        local len = length(xs_12)
        local f = function(i_13)
          return (function()
            local n1 = error("No patterns matched")
            local i1 = i_13
            return (function()
              if (lessThan(i1))(len) then
                return Data_Maybe.Just((Data_Tuple.Tuple(Partial_Unsafe.unsafePartial(function(  )
                  return (unsafeIndex1(xs_12))(i1)
                end)))((add(i1))(1)))
              else
                return (function()
                  if Data_Boolean.otherwise then
                    return Data_Maybe.Nothing
                  else
                    return n1
                  end
                end)()
              end
            end)()
          end)()
        end
        return (unfoldr(f))(0)
      end)()
    end
  end
  local take = function(n_14)
    return function(xs_15)
      local e2 = (lessThan(n_14))(1)
      return (function()
        if true == e2 then return {} else return ((slice(0))(n_14))(xs_15) end
      end)()
    end
  end
  local tail = (unconsImpl(Data_Function.const(Data_Maybe.Nothing)))(function( v_16 )
    return function(xs_17) return Data_Maybe.Just(xs_17) end
  end)
  local splitAt = function(v_18)
    return function(v1_19)
      local n3 = (function()
        local xs = v1_19
        local i = v_18
        return {
          before = ((slice(0))(i))(xs),
          after = ((slice(i))(length(xs)))(xs)
        }
      end)()
      local xs = v1_19
      local i = v_18
      return (function()
        if (lessThanOrEq(i))(0) then
          return { before = {}, after = xs }
        else
          return n3
        end
      end)()
    end
  end
  local sortBy = function(comp_20)
    return (sortByImpl(comp_20))(function(v_21)
      if "Data.Ordering.GT" == v_21["$ctor"] then
        return 1
      else
        return (function()
          if "Data.Ordering.EQ" == v_21["$ctor"] then
            return 0
          else
            return (function()
              if "Data.Ordering.LT" == v_21["$ctor"] then
                return negate(1)
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)()
      end
    end)
  end
  local sortWith = function(dictOrd_22)
    local comparing = Data_Ord.comparing(dictOrd_22)
    return function(f_23) return sortBy(comparing(f_23)) end
  end
  local sortWith1 = sortWith(Data_Ord.ordInt)
  local sort = function(dictOrd_24)
    local compare = Data_Ord.compare(dictOrd_24)
    return function(xs_25) return (sortBy(compare))(xs_25) end
  end
  local snoc = function(xs_26)
    return function(x_27)
      return Control_Monad_ST_Internal.run((Data_Array_ST.withArray(Data_Array_ST.push(x_27)))(xs_26))
    end
  end
  local singleton = function(a_28) return { a_28 } end
  local null = function(xs_29) return (eq(length(xs_29)))(0) end
  local nubByEq = function(eq2_30)
    return function(xs_31)
      return Control_Monad_ST_Internal.run((bind(Data_Array_ST.new))(function( arr_32 )
        return (discard((Control_Monad_ST_Internal.foreach(xs_31))(function( x_33 )
          return (bind((map((compose(_not_))(any(function(v_34)
            return (eq2_30(v_34))(x_33)
          end))))(Data_Array_ST.unsafeFreeze(arr_32))))(function(e_35)
            return (when(e_35))(void((Data_Array_ST.push(x_33))(arr_32)))
          end)
        end)))(function() return Data_Array_ST.unsafeFreeze(arr_32) end)
      end))
    end
  end
  local nubEq = function(dictEq_36) return nubByEq(Data_Eq.eq(dictEq_36)) end
  local modifyAtIndices = function(dictFoldable_37)
    local traverse_1 = traverse_(dictFoldable_37)
    return function(is_38)
      return function(f_39)
        return function(xs_40)
          return Control_Monad_ST_Internal.run((Data_Array_ST.withArray(function( res_41 )
            return (traverse_1(function(i_42)
              return ((Data_Array_ST.modify(i_42))(f_39))(res_41)
            end))(is_38)
          end))(xs_40))
        end
      end
    end
  end
  local mapWithIndex = Data_FunctorWithIndex.mapWithIndex(Data_FunctorWithIndex.functorWithIndexArray)
  local intersperse = function(a_43)
    return function(arr_44)
      local v = length(arr_44)
      return (function()
        local n5 = error("No patterns matched")
        local len = v
        return (function()
          if (lessThan(len))(2) then
            return arr_44
          else
            return (function()
              if Data_Boolean.otherwise then
                return Data_Array_ST.run((function()
                  local unsafeGetElem = function(idx_47)
                    return Partial_Unsafe.unsafePartial(function()
                      return (unsafeIndex1(arr_44))(idx_47)
                    end)
                  end
                  return (bind(Data_Array_ST.new))(function(out_45)
                    return (bind((Data_Array_ST.push(unsafeGetElem(0)))(out_45)))(function(  )
                      return (discard(((Control_Monad_ST_Internal._for_(1))(len))(function( idx_46 )
                        return (bind((Data_Array_ST.push(a_43))(out_45)))(function(  )
                          return void((Data_Array_ST.push(unsafeGetElem(idx_46)))(out_45))
                        end)
                      end)))(function() return pure(out_45) end)
                    end)
                  end)
                end)())
              else
                return n5
              end
            end)()
          end
        end)()
      end)()
    end
  end
  local intercalate = function(dictMonoid_48)
    return intercalate1(dictMonoid_48)
  end
  local insertAt = (_insertAt(Data_Maybe.Just))(Data_Maybe.Nothing)
  local init = function(xs_49)
    local n6 = error("No patterns matched")
    local xs1 = xs_49
    return (function()
      if null(xs1) then
        return Data_Maybe.Nothing
      else
        return (function()
          if Data_Boolean.otherwise then
            return Data_Maybe.Just(((slice(zero))((sub(length(xs1)))(one)))(xs1))
          else
            return n6
          end
        end)()
      end
    end)()
  end
  local index = (indexImpl(Data_Maybe.Just))(Data_Maybe.Nothing)
  local last = function(xs_50)
    return (index(xs_50))((sub(length(xs_50)))(1))
  end
  local unsnoc = function(xs_51)
    return (apply((map1(function(v_52)
      return function(v1_53) return { init = v_52, last = v1_53 } end
    end))(init(xs_51))))(last(xs_51))
  end
  local modifyAt = function(i_54)
    return function(f_55)
      return function(xs_56)
        local go = function(x_57)
          return ((updateAt(i_54))(f_55(x_57)))(xs_56)
        end
        return ((Data_Maybe.maybe(Data_Maybe.Nothing))(go))((index(xs_56))(i_54))
      end
    end
  end
  local span = function(p_58)
    return function(arr_59)
      local go
      go = function(i_60)
        return (function()
          local v = (index(arr_59))(i_60)
          return (function()
            if "Data.Maybe.Just" == v["$ctor"] then
              return (function()
                local x = v[0]
                return (function()
                  local e7 = p_58(x)
                  return (function()
                    if true == e7 then
                      return go((add(i_60))(1))
                    else
                      return Data_Maybe.Just(i_60)
                    end
                  end)()
                end)()
              end)()
            else
              return (function()
                if "Data.Maybe.Nothing" == v["$ctor"] then
                  return Data_Maybe.Nothing
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end)()
      end
      local breakIndex = go(0)
      return (function()
        if "Data.Maybe.Just" == breakIndex["$ctor"] then
          return (function()
            if 0 == breakIndex[0] then
              return { init = {}, rest = arr_59 }
            else
              return (function()
                local i = breakIndex[0]
                return {
                  init = ((slice(0))(i))(arr_59),
                  rest = ((slice(i))(length(arr_59)))(arr_59)
                }
              end)()
            end
          end)()
        else
          return (function()
            if "Data.Maybe.Nothing" == breakIndex["$ctor"] then
              return { init = arr_59, rest = {} }
            else
              return error("No patterns matched")
            end
          end)()
        end
      end)()
    end
  end
  local takeWhile = function(p_61)
    return function(xs_62) return (span(p_61))(xs_62).init end
  end
  local unzip = function(xs_63)
    return Control_Monad_ST_Internal.run((bind(Data_Array_ST.new))(function( fsts_64 )
      return (bind(Data_Array_ST.new))(function(snds_65)
        return (bind(Data_Array_ST_Iterator.iterator(function(v_66)
          return (index(xs_63))(v_66)
        end)))(function(iter_67)
          return (discard((Data_Array_ST_Iterator.iterate(iter_67))(function( v_68 )
            return (function()
              if "Data.Tuple.Tuple" == v_68["$ctor"] then
                return (function()
                  local snd = v_68[1]
                  local fst = v_68[0]
                  return (discard(void((Data_Array_ST.push(fst))(fsts_64))))(function(  )
                    return void((Data_Array_ST.push(snd))(snds_65))
                  end)
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end)))(function()
            return (bind(Data_Array_ST.unsafeFreeze(fsts_64)))(function( fstsPrime_69 )
              return (bind(Data_Array_ST.unsafeFreeze(snds_65)))(function( sndsPrime_70 )
                return pure((Data_Tuple.Tuple(fstsPrime_69))(sndsPrime_70))
              end)
            end)
          end)
        end)
      end)
    end))
  end
  local head = function(xs_71) return (index(xs_71))(0) end
  local nubBy = function(comp_72)
    return function(xs_73)
      local indexedAndSorted = (sortBy(function(x_77)
        return function(y_78)
          return (comp_72(Data_Tuple.snd(x_77)))(Data_Tuple.snd(y_78))
        end
      end))((mapWithIndex(Data_Tuple.Tuple))(xs_73))
      return (function()
        local v = head(indexedAndSorted)
        return (function()
          if "Data.Maybe.Nothing" == v["$ctor"] then
            return {}
          else
            return (function()
              if "Data.Maybe.Just" == v["$ctor"] then
                return (function()
                  local x = v[0]
                  return (map2(Data_Tuple.snd))((sortWith1(Data_Tuple.fst))(Control_Monad_ST_Internal.run((bind(Data_Array_ST.unsafeThaw(singleton(x))))(function( result_74 )
                    return (discard((Control_Monad_ST_Internal.foreach(indexedAndSorted))(function( v1_75 )
                      return (function()
                        if "Data.Tuple.Tuple" == v1_75["$ctor"] then
                          return (function()
                            local xPrime = v1_75[1]
                            local pair = v1_75
                            return (bind((map((compose(Data_Tuple.snd))(Partial_Unsafe.unsafePartial(function(  )
                              return (compose(fromJust))(last)
                            end))))(Data_Array_ST.unsafeFreeze(result_74))))(function( lst_76 )
                              return (when((notEq((comp_72(lst_76))(xPrime)))(Data_Ordering.EQ)))(void((Data_Array_ST.push(pair))(result_74)))
                            end)
                          end)()
                        else
                          return error("No patterns matched")
                        end
                      end)()
                    end)))(function()
                      return Data_Array_ST.unsafeFreeze(result_74)
                    end)
                  end))))
                end)()
              else
                return error("No patterns matched")
              end
            end)()
          end
        end)()
      end)()
    end
  end
  local nub = function(dictOrd_79)
    return nubBy(Data_Ord.compare(dictOrd_79))
  end
  local groupBy = function(op_80)
    return function(xs_81)
      return Control_Monad_ST_Internal.run((bind(Data_Array_ST.new))(function( result_82 )
        return (bind(Data_Array_ST_Iterator.iterator(function(v_83)
          return (index(xs_81))(v_83)
        end)))(function(iter_84)
          return (discard((Data_Array_ST_Iterator.iterate(iter_84))(function( x_85 )
            return void((bind(Data_Array_ST.new))(function(sub1_86)
              return (bind((Data_Array_ST.push(x_85))(sub1_86)))(function()
                return (discard(((Data_Array_ST_Iterator.pushWhile(op_80(x_85)))(iter_84))(sub1_86)))(function(  )
                  return (bind(Data_Array_ST.unsafeFreeze(sub1_86)))(function( grp_87 )
                    return (Data_Array_ST.push(grp_87))(result_82)
                  end)
                end)
              end)
            end))
          end)))(function() return Data_Array_ST.unsafeFreeze(result_82) end)
        end)
      end))
    end
  end
  local groupAllBy = function(cmp_88)
    return (compose(groupBy(function(x_89)
      return function(y_90)
        return (eq1((cmp_88(x_89))(y_90)))(Data_Ordering.EQ)
      end
    end)))(sortBy(cmp_88))
  end
  local groupAll = function(dictOrd_91)
    return groupAllBy(Data_Ord.compare(dictOrd_91))
  end
  local group = function(dictEq_92)
    local eq2 = Data_Eq.eq(dictEq_92)
    return function(xs_93) return (groupBy(eq2))(xs_93) end
  end
  local fromFoldable = function(dictFoldable_94)
    return fromFoldableImpl(Data_Foldable.foldr(dictFoldable_94))
  end
  local foldr = Data_Foldable.foldr(Data_Foldable.foldableArray)
  local foldl = Data_Foldable.foldl(Data_Foldable.foldableArray)
  local transpose = function(xs_95)
    local buildNext = function(idx_96)
      return (((Data_Function.flip(foldl))(Data_Maybe.Nothing))(function(acc_97)
        return function(nextArr_98)
          return ((Data_Maybe.maybe(acc_97))(function(el_99)
            return Data_Maybe.Just(((Data_Maybe.maybe({
              el_99
            }))((Data_Function.flip(snoc))(el_99)))(acc_97))
          end))((index(nextArr_98))(idx_96))
        end
      end))(xs_95)
    end
    local go
    go = function(idx_100)
      return function(allArrays_101)
        return (function()
          local v = buildNext(idx_100)
          return (function()
            if "Data.Maybe.Nothing" == v["$ctor"] then
              return allArrays_101
            else
              return (function()
                if "Data.Maybe.Just" == v["$ctor"] then
                  return (function()
                    local next = v[0]
                    return (go((add(idx_100))(1)))((snoc(allArrays_101))(next))
                  end)()
                else
                  return error("No patterns matched")
                end
              end)()
            end
          end)()
        end)()
      end
    end
    return (go(0))({})
  end
  local foldRecM = function(dictMonadRec_102)
    local Monad0 = dictMonadRec_102.Monad0(Prim.undefined)
    local pure1 = Control_Applicative.pure(Monad0.Applicative0(Prim.undefined))
    local bind1 = Control_Bind.bind(Monad0.Bind1(Prim.undefined))
    local tailRecM2 = Control_Monad_Rec_Class.tailRecM2(dictMonadRec_102)
    return function(f_103)
      return function(b_104)
        return function(array_105)
          return (function()
            local go = function(res_106)
              return function(i_107)
                return (function()
                  local n15 = error("No patterns matched")
                  local i1 = i_107
                  local res1 = res_106
                  return (function()
                    if (greaterThanOrEq(i1))(length(array_105)) then
                      return pure1(Control_Monad_Rec_Class.Done(res1))
                    else
                      return (function()
                        if Data_Boolean.otherwise then
                          return (bind1((f_103(res1))(Partial_Unsafe.unsafePartial(function(  )
                            return (unsafeIndex1(array_105))(i1)
                          end))))(function(resPrime_108)
                            return pure1(Control_Monad_Rec_Class.Loop({
                              a = resPrime_108,
                              b = (add(i1))(1)
                            }))
                          end)
                        else
                          return n15
                        end
                      end)()
                    end
                  end)()
                end)()
              end
            end
            return ((tailRecM2(go))(b_104))(0)
          end)()
        end
      end
    end
  end
  local foldMap = function(dictMonoid_109) return foldMap1(dictMonoid_109) end
  local foldM
  foldM = function(dictMonad_110)
    local pure1 = Control_Applicative.pure(dictMonad_110.Applicative0(Prim.undefined))
    local bind1 = Control_Bind.bind(dictMonad_110.Bind1(Prim.undefined))
    return function(f_111)
      return function(b_112)
        return (unconsImpl(function(v_113)
          return pure1(b_112)
        end))(function(a_114)
          return function(as_115)
            return (bind1((f_111(b_112))(a_114)))(function(bPrime_116)
              return (((foldM(dictMonad_110))(f_111))(bPrime_116))(as_115)
            end)
          end
        end)
      end
    end
  end
  local fold = function(dictMonoid_117) return fold1(dictMonoid_117) end
  local findMap = (findMapImpl(Data_Maybe.Nothing))(Data_Maybe.isJust)
  local findLastIndex = (findLastIndexImpl(Data_Maybe.Just))(Data_Maybe.Nothing)
  local insertBy = function(cmp_118)
    return function(x_119)
      return function(ys_120)
        local i = ((Data_Maybe.maybe(0))(function(v_121)
          return (add(v_121))(1)
        end))((findLastIndex(function(y_122)
          return (eq1((cmp_118(x_119))(y_122)))(Data_Ordering.GT)
        end))(ys_120))
        return Partial_Unsafe.unsafePartial(function()
          return fromJust(((insertAt(i))(x_119))(ys_120))
        end)
      end
    end
  end
  local insert = function(dictOrd_123)
    return insertBy(Data_Ord.compare(dictOrd_123))
  end
  local findIndex = (findIndexImpl(Data_Maybe.Just))(Data_Maybe.Nothing)
  local intersectBy = function(eq2_124)
    return function(xs_125)
      return function(ys_126)
        return (filter(function(x_127)
          return Data_Maybe.isJust((findIndex(eq2_124(x_127)))(ys_126))
        end))(xs_125)
      end
    end
  end
  local intersect = function(dictEq_128)
    return intersectBy(Data_Eq.eq(dictEq_128))
  end
  local find = function(f_129)
    return function(xs_130)
      return (map1(Partial_Unsafe.unsafePartial(function()
        return unsafeIndex1(xs_130)
      end)))((findIndex(f_129))(xs_130))
    end
  end
  local elemLastIndex = function(dictEq_131)
    local eq2 = Data_Eq.eq(dictEq_131)
    return function(x_132)
      return findLastIndex(function(v_133) return (eq2(v_133))(x_132) end)
    end
  end
  local elemIndex = function(dictEq_134)
    local eq2 = Data_Eq.eq(dictEq_134)
    return function(x_135)
      return findIndex(function(v_136) return (eq2(v_136))(x_135) end)
    end
  end
  local notElem = function(dictEq_137)
    local elemIndex1 = elemIndex(dictEq_137)
    return function(a_138)
      return function(arr_139)
        return Data_Maybe.isNothing((elemIndex1(a_138))(arr_139))
      end
    end
  end
  local elem = function(dictEq_140)
    local elemIndex1 = elemIndex(dictEq_140)
    return function(a_141)
      return function(arr_142)
        return Data_Maybe.isJust((elemIndex1(a_141))(arr_142))
      end
    end
  end
  local dropWhile = function(p_143)
    return function(xs_144) return (span(p_143))(xs_144).rest end
  end
  local dropEnd = function(n_145)
    return function(xs_146)
      return (take((sub(length(xs_146)))(n_145)))(xs_146)
    end
  end
  local drop = function(n_147)
    return function(xs_148)
      local e16 = (lessThan(n_147))(1)
      return (function()
        if true == e16 then
          return xs_148
        else
          return ((slice(n_147))(length(xs_148)))(xs_148)
        end
      end)()
    end
  end
  local takeEnd = function(n_149)
    return function(xs_150)
      return (drop((sub(length(xs_150)))(n_149)))(xs_150)
    end
  end
  local deleteAt = (_deleteAt(Data_Maybe.Just))(Data_Maybe.Nothing)
  local deleteBy = function(v_151)
    return function(v1_152)
      return function(v2_153)
        if 0 == #(v2_153) then
          return {}
        else
          return (function()
            local ys = v2_153
            local x = v1_152
            local eq2 = v_151
            return ((Data_Maybe.maybe(ys))(function(i_154)
              return Partial_Unsafe.unsafePartial(function()
                return fromJust((deleteAt(i_154))(ys))
              end)
            end))((findIndex(eq2(x)))(ys))
          end)()
        end
      end
    end
  end
  local unionBy = function(eq2_155)
    return function(xs_156)
      return function(ys_157)
        return (append(xs_156))(((foldl(Data_Function.flip(deleteBy(eq2_155))))((nubByEq(eq2_155))(ys_157)))(xs_156))
      end
    end
  end
  local union = function(dictEq_158) return unionBy(Data_Eq.eq(dictEq_158)) end
  local delete = function(dictEq_159)
    return deleteBy(Data_Eq.eq(dictEq_159))
  end
  local difference = function(dictEq_160) return foldr(delete(dictEq_160)) end
  local cons = function(x_161)
    return function(xs_162) return (append({ x_161 }))(xs_162) end
  end
  local some, many
  some = function(dictAlternative_163)
    local apply1 = Control_Apply.apply(dictAlternative_163.Applicative0(Prim.undefined).Apply0(Prim.undefined))
    local map3 = Data_Functor.map(dictAlternative_163.Plus1(Prim.undefined).Alt0(Prim.undefined).Functor0(Prim.undefined))
    return function(dictLazy_164)
      return (function()
        local defer = Control_Lazy.defer(dictLazy_164)
        return function(v_165)
          return (apply1((map3(cons))(v_165)))(defer(function(v1_166)
            return ((many(dictAlternative_163))(dictLazy_164))(v_165)
          end))
        end
      end)()
    end
  end
  many = function(dictAlternative_167)
    local alt = Control_Alt.alt(dictAlternative_167.Plus1(Prim.undefined).Alt0(Prim.undefined))
    local pure1 = Control_Applicative.pure(dictAlternative_167.Applicative0(Prim.undefined))
    return function(dictLazy_168)
      return function(v_169)
        return (alt(((some(dictAlternative_167))(dictLazy_168))(v_169)))(pure1({}))
      end
    end
  end
  local concatMap = Data_Function.flip(Control_Bind.bind(Control_Bind.bindArray))
  local mapMaybe = function(f_170)
    return concatMap((compose((Data_Maybe.maybe({}))(singleton)))(f_170))
  end
  local filterA = function(dictApplicative_171)
    local traverse1 = traverse(dictApplicative_171)
    local map3 = Data_Functor.map(dictApplicative_171.Apply0(Prim.undefined).Functor0(Prim.undefined))
    return function(p_172)
      return (composeFlipped(traverse1(function(x_173)
        return (map3(Data_Tuple.Tuple(x_173)))(p_172(x_173))
      end)))(map3(mapMaybe(function(v_174)
        return (function()
          if "Data.Tuple.Tuple" == v_174["$ctor"] then
            return (function()
              local b = v_174[1]
              local x = v_174[0]
              return (function()
                if true == b then
                  return Data_Maybe.Just(x)
                else
                  return Data_Maybe.Nothing
                end
              end)()
            end)()
          else
            return error("No patterns matched")
          end
        end)()
      end)))
    end
  end
  local catMaybes = mapMaybe(Control_Category.identity(Control_Category.categoryFn))
  local alterAt = function(i_175)
    return function(f_176)
      return function(xs_177)
        local go = function(x_178)
          return (function()
            local v = f_176(x_178)
            return (function()
              if "Data.Maybe.Nothing" == v["$ctor"] then
                return (deleteAt(i_175))(xs_177)
              else
                return (function()
                  if "Data.Maybe.Just" == v["$ctor"] then
                    return (function()
                      local xPrime = v[0]
                      return ((updateAt(i_175))(xPrime))(xs_177)
                    end)()
                  else
                    return error("No patterns matched")
                  end
                end)()
              end
            end)()
          end)()
        end
        return ((Data_Maybe.maybe(Data_Maybe.Nothing))(go))((index(xs_177))(i_175))
      end
    end
  end
  return {
    fromFoldable = fromFoldable,
    toUnfoldable = toUnfoldable,
    singleton = singleton,
    range = range,
    replicate = replicate,
    some = some,
    many = many,
    null = null,
    length = length,
    cons = cons,
    snoc = snoc,
    insert = insert,
    insertBy = insertBy,
    head = head,
    last = last,
    tail = tail,
    init = init,
    uncons = uncons,
    unsnoc = unsnoc,
    index = index,
    elem = elem,
    notElem = notElem,
    elemIndex = elemIndex,
    elemLastIndex = elemLastIndex,
    find = find,
    findMap = findMap,
    findIndex = findIndex,
    findLastIndex = findLastIndex,
    insertAt = insertAt,
    deleteAt = deleteAt,
    updateAt = updateAt,
    updateAtIndices = updateAtIndices,
    modifyAt = modifyAt,
    modifyAtIndices = modifyAtIndices,
    alterAt = alterAt,
    intersperse = intersperse,
    reverse = reverse,
    concat = concat,
    concatMap = concatMap,
    filter = filter,
    partition = partition,
    splitAt = splitAt,
    filterA = filterA,
    mapMaybe = mapMaybe,
    catMaybes = catMaybes,
    mapWithIndex = mapWithIndex,
    foldl = foldl,
    foldr = foldr,
    foldMap = foldMap,
    fold = fold,
    intercalate = intercalate,
    transpose = transpose,
    scanl = scanl,
    scanr = scanr,
    sort = sort,
    sortBy = sortBy,
    sortWith = sortWith,
    slice = slice,
    take = take,
    takeEnd = takeEnd,
    takeWhile = takeWhile,
    drop = drop,
    dropEnd = dropEnd,
    dropWhile = dropWhile,
    span = span,
    group = group,
    groupAll = groupAll,
    groupBy = groupBy,
    groupAllBy = groupAllBy,
    nub = nub,
    nubEq = nubEq,
    nubBy = nubBy,
    nubByEq = nubByEq,
    union = union,
    unionBy = unionBy,
    delete = delete,
    deleteBy = deleteBy,
    difference = difference,
    intersect = intersect,
    intersectBy = intersectBy,
    zipWith = zipWith,
    zipWithA = zipWithA,
    zip = zip,
    unzip = unzip,
    any = any,
    all = all,
    foldM = foldM,
    foldRecM = foldRecM,
    unsafeIndex = unsafeIndex
  }
end)()
local Effect_Console = (function()
  local foreign = (function()
    return {

        log = function(s) return function() print(s) end end,

        warn = function(s) return function() print(s) end end,

        error = function(s) return function() print(s) end end,

        info = function(s) return function() print(s) end end,

        debug = function(s) return function() print(s) end end,

        time = function(s) return function() error("Sorry, console timers aren't implemented yet") end end,

        timeLog = function(s) return function() error("Sorry, console timers aren't implemented yet") end end,

        timeEnd = function(s) return function() error("Sorry, console timers aren't implemented yet") end end,

        clear = function() io.write("\027[H\027[2J") end

    }

  end)()
  local log = foreign.log
  local warn = foreign.warn
  local error = foreign.error
  local info = foreign.info
  local debug = foreign.debug
  local time = foreign.time
  local timeLog = foreign.timeLog
  local timeEnd = foreign.timeEnd
  local clear = foreign.clear
  local warnShow = function(dictShow_0)
    local show = Data_Show.show(dictShow_0)
    return function(a_1) return warn(show(a_1)) end
  end
  local logShow = function(dictShow_2)
    local show = Data_Show.show(dictShow_2)
    return function(a_3) return log(show(a_3)) end
  end
  local infoShow = function(dictShow_4)
    local show = Data_Show.show(dictShow_4)
    return function(a_5) return info(show(a_5)) end
  end
  local errorShow = function(dictShow_6)
    local show = Data_Show.show(dictShow_6)
    return function(a_7) return error(show(a_7)) end
  end
  local debugShow = function(dictShow_8)
    local show = Data_Show.show(dictShow_8)
    return function(a_9) return debug(show(a_9)) end
  end
  return {
    log = log,
    logShow = logShow,
    warn = warn,
    warnShow = warnShow,
    error = error,
    errorShow = errorShow,
    info = info,
    infoShow = infoShow,
    debug = debug,
    debugShow = debugShow,
    time = time,
    timeLog = timeLog,
    timeEnd = timeEnd,
    clear = clear
  }
end)()
local Main = (function()
  local sub = Data_Ring.sub(Data_Ring.ringInt)
  local mul = Data_Semiring.mul(Data_Semiring.semiringInt)
  local discard = (Control_Bind.discard(Control_Bind.discardUnit))(Effect.bindEffect)
  local logShow = Effect_Console.logShow(Data_Show.showInt)
  local for_ = (Data_Foldable.for_(Effect.applicativeEffect))(Data_Foldable.foldableArray)
  local noStackOverflow
  noStackOverflow = function(v_0)
    if 0 == v_0 then
      return 42
    else
      return (function()
        local i = v_0
        return noStackOverflow((sub(i))(1))
      end)()
    end
  end
  local fact
  fact = function(v_1)
    if 0 == v_1 then
      return 1
    else
      return (function() local n = v_1 return (mul(n))(fact((sub(n))(1))) end)()
    end
  end
  local main = (discard(logShow(((Data_Semiring.add(Data_Semiring.semiringInt))(2))((mul(3))(4)))))(function(  )
    return (discard(logShow(noStackOverflow(100000000))))(function()
      return (for_((Data_Array.range(0))(10)))(function(n_2)
        return logShow(fact(n_2))
      end)
    end)
  end)
  return { main = main, fact = fact, noStackOverflow = noStackOverflow }
end)()
return Main
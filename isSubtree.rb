#
# Definition for binary tree:
# class Tree
#   attr_accessor :value, :left, :right
#   def initialize(val)
#     @value = val
#     @left = nil
#     @right = nil
# end
require 'byebug'
def isSubtree(t1, t2)
    if t1.nil? && t2.nil? 
        return true 
    elsif t2.nil?
        return true 
    elsif t1.nil?
        return false 
    end
    
    if t1['value'] != t2['value'] 
        if (t1['left'] && t1['right'])
            return isSubtree(t1['left'], t2) || isSubtree(t1['right'], t2)
        elsif (t1['right'])
            return isSubtree(t1['right'], t2)
        elsif (t1['left'])
            return isSubtree(t1['left'], t2)
        else 
            return false 
        end 
    else 
        if (t2['left'] && t2['right'])
            return isSubtree(t1['left'], t2['left']) && isSubtree(t1['right'],t2['right'])
        elsif (t2['right'])
            return isSubtree(t1['right'], t2['right'])
        elsif (t2['left'])
            return isSubtree(t1['left'], t2['left'])
        else 
	    debugger
            p t1['value'] 
            p t2['value']
            return true
        end
    end 
end

p isSubtree({
    "value": -960,
    "left": {
        "value": 485,
        "left": {
            "value": -69,
            "left": {
                "value": 935,
                "left": {
                    "value": -286,
                    "left": {
                        "value": 141,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": 232,
                        "left": nil,
                        "right": nil
                    }
                },
                "right": {
                    "value": -485,
                    "left": {
                        "value": 453,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": -385,
                        "left": nil,
                        "right": nil
                    }
                }
            },
            "right": {
                "value": 28,
                "left": {
                    "value": 877,
                    "left": {
                        "value": 274,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": 548,
                        "left": nil,
                        "right": nil
                    }
                },
                "right": {
                    "value": 379,
                    "left": {
                        "value": -232,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": -50,
                        "left": nil,
                        "right": nil
                    }
                }
            }
        },
        "right": {
            "value": 700,
            "left": {
                "value": 681,
                "left": {
                    "value": -735,
                    "left": {
                        "value": -583,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": -38,
                        "left": nil,
                        "right": nil
                    }
                },
                "right": {
                    "value": -819,
                    "left": {
                        "value": 333,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": 670,
                        "left": nil,
                        "right": nil
                    }
                }
            },
            "right": {
                "value": -46,
                "left": {
                    "value": -450,
                    "left": {
                        "value": -198,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": 995,
                        "left": nil,
                        "right": nil
                    }
                },
                "right": {
                    "value": -817,
                    "left": {
                        "value": -812,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": 643,
                        "left": nil,
                        "right": nil
                    }
                }
            }
        }
    },
    "right": {
        "value": 563,
        "left": {
            "value": 839,
            "left": {
                "value": -341,
                "left": {
                    "value": 292,
                    "left": {
                        "value": 516,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": -295,
                        "left": nil,
                        "right": nil
                    }
                },
                "right": {
                    "value": -199,
                    "left": {
                        "value": 1,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": -365,
                        "left": nil,
                        "right": nil
                    }
                }
            },
            "right": {
                "value": -537,
                "left": {
                    "value": 619,
                    "left": {
                        "value": -191,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": 212,
                        "left": nil,
                        "right": nil
                    }
                },
                "right": {
                    "value": 685,
                    "left": {
                        "value": 559,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": -259,
                        "left": nil,
                        "right": nil
                    }
                }
            }
        },
        "right": {
            "value": 189,
            "left": {
                "value": -306,
                "left": {
                    "value": 167,
                    "left": {
                        "value": -498,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": -585,
                        "left": nil,
                        "right": nil
                    }
                },
                "right": {
                    "value": 543,
                    "left": {
                        "value": -32,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": 187,
                        "left": nil,
                        "right": {
                            "value": 5,
                            "left": nil,
                            "right": nil
                        }
                    }
                }
            },
            "right": {
                "value": 590,
                "left": {
                    "value": -237,
                    "left": {
                        "value": 596,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": -445,
                        "left": nil,
                        "right": nil
                    }
                },
                "right": {
                    "value": -138,
                    "left": {
                        "value": -266,
                        "left": nil,
                        "right": nil
                    },
                    "right": {
                        "value": -85,
                        "left": nil,
                        "right": nil
                    }
                }
            }
        }
    }
},
{
    "value": 543,
    "left": {
        "value": -32,
        "left": nil,
        "right": nil
    },
    "right": {
        "value": 187,
        "left": nil,
        "right": nil
    }
})

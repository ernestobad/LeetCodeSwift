//
//  WordLadder.swift
//  LeetCode
//
//  Created by Ernesto Badillo on 4/28/19.
//  Copyright © 2019 Ernesto Badillo. All rights reserved.
//

import Foundation

class WordLadder {
    static func run() {
        
        // "hot" -> "dot" -> "dog"
        print("Expected: 3, Actual: \(WordLadder().ladderLength("hot", "dog", ["hot","cog","dog","tot","hog","hop","pot","dot"]))")
        
        // "hit" -> "hot" -> "dot" -> "dog" -> "cog",
        print("Expected: 5, Actual: \(WordLadder().ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"]))")

        // "log" -> "cog",
        print("Expected: 2, Actual: \(WordLadder().ladderLength("log", "cog", ["hot","dot","dog","lot","log","cog"]))")

        // "tog" -> "cog"
        print("Expected: 2, Actual: \(WordLadder().ladderLength("tog", "cog", ["hot","dot","dog","lot","log","cog"]))")

        print("Expected: 0, Actual: \(WordLadder().ladderLength("xyz", "cog", ["hot","dot","dog","lot","log","cog"]))")

        print("Expected: ?, Actual: \(WordLadder().ladderLength("qa", "sq", ["si","go","se","cm","so","ph","mt","db","mb","sb","kr","ln","tm","le","av","sm","ar","ci","ca","br","ti","ba","to","ra","fa","yo","ow","sn","ya","cr","po","fe","ho","ma","re","or","rn","au","ur","rh","sr","tc","lt","lo","as","fr","nb","yb","if","pb","ge","th","pm","rb","sh","co","ga","li","ha","hz","no","bi","di","hi","qa","pi","os","uh","wm","an","me","mo","na","la","st","er","sc","ne","mn","mi","am","ex","pt","io","be","fm","ta","tb","ni","mr","pa","he","lr","sq","ye"]))")

        print("Expected: ?, Actual: \(WordLadder().ladderLength("cet", "ism", ["kid","tag","pup","ail","tun","woo","erg","luz","brr","gay","sip","kay","per","val","mes","ohs","now","boa","cet","pal","bar","die","war","hay","eco","pub","lob","rue","fry","lit","rex","jan","cot","bid","ali","pay","col","gum","ger","row","won","dan","rum","fad","tut","sag","yip","sui","ark","has","zip","fez","own","ump","dis","ads","max","jaw","out","btu","ana","gap","cry","led","abe","box","ore","pig","fie","toy","fat","cal","lie","noh","sew","ono","tam","flu","mgm","ply","awe","pry","tit","tie","yet","too","tax","jim","san","pan","map","ski","ova","wed","non","wac","nut","why","bye","lye","oct","old","fin","feb","chi","sap","owl","log","tod","dot","bow","fob","for","joe","ivy","fan","age","fax","hip","jib","mel","hus","sob","ifs","tab","ara","dab","jag","jar","arm","lot","tom","sax","tex","yum","pei","wen","wry","ire","irk","far","mew","wit","doe","gas","rte","ian","pot","ask","wag","hag","amy","nag","ron","soy","gin","don","tug","fay","vic","boo","nam","ave","buy","sop","but","orb","fen","paw","his","sub","bob","yea","oft","inn","rod","yam","pew","web","hod","hun","gyp","wei","wis","rob","gad","pie","mon","dog","bib","rub","ere","dig","era","cat","fox","bee","mod","day","apr","vie","nev","jam","pam","new","aye","ani","and","ibm","yap","can","pyx","tar","kin","fog","hum","pip","cup","dye","lyx","jog","nun","par","wan","fey","bus","oak","bad","ats","set","qom","vat","eat","pus","rev","axe","ion","six","ila","lao","mom","mas","pro","few","opt","poe","art","ash","oar","cap","lop","may","shy","rid","bat","sum","rim","fee","bmw","sky","maj","hue","thy","ava","rap","den","fla","auk","cox","ibo","hey","saw","vim","sec","ltd","you","its","tat","dew","eva","tog","ram","let","see","zit","maw","nix","ate","gig","rep","owe","ind","hog","eve","sam","zoo","any","dow","cod","bed","vet","ham","sis","hex","via","fir","nod","mao","aug","mum","hoe","bah","hal","keg","hew","zed","tow","gog","ass","dem","who","bet","gos","son","ear","spy","kit","boy","due","sen","oaf","mix","hep","fur","ada","bin","nil","mia","ewe","hit","fix","sad","rib","eye","hop","haw","wax","mid","tad","ken","wad","rye","pap","bog","gut","ito","woe","our","ado","sin","mad","ray","hon","roy","dip","hen","iva","lug","asp","hui","yak","bay","poi","yep","bun","try","lad","elm","nat","wyo","gym","dug","toe","dee","wig","sly","rip","geo","cog","pas","zen","odd","nan","lay","pod","fit","hem","joy","bum","rio","yon","dec","leg","put","sue","dim","pet","yaw","nub","bit","bur","sid","sun","oil","red","doc","moe","caw","eel","dix","cub","end","gem","off","yew","hug","pop","tub","sgt","lid","pun","ton","sol","din","yup","jab","pea","bug","gag","mil","jig","hub","low","did","tin","get","gte","sox","lei","mig","fig","lon","use","ban","flo","nov","jut","bag","mir","sty","lap","two","ins","con","ant","net","tux","ode","stu","mug","cad","nap","gun","fop","tot","sow","sal","sic","ted","wot","del","imp","cob","way","ann","tan","mci","job","wet","ism","err","him","all","pad","hah","hie","aim","ike","jed","ego","mac","baa","min","com","ill","was","cab","ago","ina","big","ilk","gal","tap","duh","ola","ran","lab","top","gob","hot","ora","tia","kip","han","met","hut","she","sac","fed","goo","tee","ell","not","act","gil","rut","ala","ape","rig","cid","god","duo","lin","aid","gel","awl","lag","elf","liz","ref","aha","fib","oho","tho","her","nor","ace","adz","fun","ned","coo","win","tao","coy","van","man","pit","guy","foe","hid","mai","sup","jay","hob","mow","jot","are","pol","arc","lax","aft","alb","len","air","pug","pox","vow","got","meg","zoe","amp","ale","bud","gee","pin","dun","pat","ten","mob"]))")
    }
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        
        var beginWordIdxs = [Int]()
        var endWordIdx: Int?
        
        var map = [Int: [Int]]()
        for (wordIdx, word) in wordList.enumerated() {
            for (_, hashValue) in getHashValues(word) {
                var wordsIdxs = map[hashValue] ?? [Int]()
                wordsIdxs.append(wordIdx)
                map[hashValue] = wordsIdxs
            }
            if hasOneMissmatch(beginWord, word) {
                beginWordIdxs.append(wordIdx)
            }
            if endWordIdx == nil, endWord == word {
                endWordIdx = wordIdx
            }
        }
        
        guard !beginWordIdxs.isEmpty, endWordIdx != nil else {
            return 0
        }
        
        var maxDepthDict = [Int: Int]()
        var ladderSet = Set<Int>()
        var notFoundSet = Set<Int>()
        
        var minLength: Int?
        for beginWordIdx in beginWordIdxs {
            ladderSet.insert(beginWordIdx)
            let length = ladderLength(beginWordIdx, endWordIdx!, map, wordList, &ladderSet, &notFoundSet, &maxDepthDict, wordList.count).length
            ladderSet.remove(beginWordIdx)
            if length > 0, length < (minLength ?? Int.max) {
                minLength = length
            }
        }
        
        if let minLength = minLength {
            return minLength+1
        } else {
            return 0
        }
    }
    
    func ladderLength(_ beginWordIdx: Int,
                      _ endWordIdx: Int,
                      _ map: [Int: [Int]],
                      _ wordList: [String],
                      _ ladderSet: inout Set<Int>,
                      _ notFoundSet: inout Set<Int>,
                      _ maxDepthDict: inout [Int: Int],
                      _ maxLength: Int) -> (length: Int, searchDepth: Int) {
        
        guard beginWordIdx != endWordIdx else {
            return (1, 0)
        }
        
        guard ladderSet.count < maxLength else {
            return (0, 0)
        }
        
        let maxRemainingDepth = (maxLength - ladderSet.count)-1
        let beginWord = wordList[beginWordIdx]
        var maxSearchDepth = 0
        var minLength = 0
        var allSkipped = true
        for (hashValueIdx, hashValue) in getHashValues(beginWord) {
            for wordIdx in map[hashValue] ?? [Int]() {
                
                guard !ladderSet.contains(wordIdx), !notFoundSet.contains(wordIdx) else {
                    continue
                }
                
                allSkipped = false
                
                guard (maxDepthDict[wordIdx] ?? 0) <= maxRemainingDepth else {
                    continue
                }
                
                let nextWord = wordList[wordIdx]
                let nextWordIdx = wordIdx
                
                guard hasOneMissmatchAt(beginWord, nextWord, hashValueIdx) else {
                    continue
                }
                
                ladderSet.insert(wordIdx)
                let (length, searchDepth) = ladderLength(nextWordIdx,
                                                         endWordIdx,
                                                         map,
                                                         wordList,
                                                         &ladderSet,
                                                         &notFoundSet,
                                                         &maxDepthDict,
                                                         minLength > 0 ? min(minLength, maxLength-1) : maxLength-1)
                ladderSet.remove(wordIdx)
                
                if length > 0, minLength == 0 || length < minLength {
                    minLength = length
                } else if length == 0, maxSearchDepth == 0 || searchDepth > maxSearchDepth {
                    maxSearchDepth = searchDepth
                }
            }
        }
        
        if allSkipped {
            notFoundSet.formUnion(ladderSet)
        }
        
        if minLength == 0 {
            let finalMaxSearchDepth = max(maxDepthDict[beginWordIdx] ?? 0, maxSearchDepth+1)
            maxDepthDict[beginWordIdx] = finalMaxSearchDepth
            return (0, finalMaxSearchDepth)
        } else {
            return (minLength+1, 0)
        }
    }
    
    func getHashValues(_ word: String) -> [(String.Index, Int)] {
        var fullHashValue = 0
        for idx in word.indices {
            let ch = word[idx]
            fullHashValue ^= "\(idx)\(ch)".hashValue
        }
        var hashValues = [(String.Index, Int)]()
        for idx in word.indices {
            let ch = word[idx]
            let subHashValue = fullHashValue ^ "\(idx)\(ch)".hashValue
            hashValues.append((idx, subHashValue))
        }
        return hashValues
    }
    
    func hasOneMissmatch(_ word1: String, _ word2: String) -> Bool {
        var diffs = 0
        for cidx in word1.indices {
            if word1[cidx] != word2[cidx] {
                diffs += 1
                if diffs > 1 { break }
            }
        }
        return diffs == 1
    }
    
    func hasOneMissmatchAt(_ word1: String, _ word2: String, _ idx: String.Index) -> Bool {
        for cidx in word1.indices {
            if cidx == idx {
                if word1[cidx] == word2[cidx] {
                    return false
                }
            } else {
                if word1[cidx] != word2[cidx] {
                    return false
                }
            }
        }
        return true
    }
}

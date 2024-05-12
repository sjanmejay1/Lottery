import React from "react";
import { Link } from "react-router-dom";
import "./Intro.css";
const Intro = () => {
  return (
    <>
      <div className="center">
      <ul style={{marginTop:'50px', display:'flex', flexDirection:'column',justifyContent:'center',alignItems:'center',listStyle:'none'}}>
          <li className="list-group-item" aria-disabled="true">
            <h2>You are</h2>
          </li>
          <li className="list-group-item">
            <Link to="/manager" className="text-decoration-none text">
              <button className="button1">Manager</button>
            </Link>

            <Link to="/players" className="text-decoration-none text">
              <button className="button1 player">Player</button>
            </Link>
          </li>
      </ul>
        </div>
    </>
  );
};

export default Intro;